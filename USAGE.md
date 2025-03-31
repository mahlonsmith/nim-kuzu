
# Usage

This document is a quick guide for how to use this library.  If you've cloned
this repository, you can:

> % nimble docs

To auto-generate API docs -- with the C wrappers, it's a lot and it's hard to
know where to start.


## Prior Reading

If you're just starting with Kuzu or graph databases, it's probably a good idea
to familiarize yourself with the [Kuzu Documentation](https://docs.kuzudb.com/)
and the [Cypher Language](https://docs.kuzudb.com/tutorials/cypher/).  This
library won't do much for you by itself without a basic understanding of Kuzu usage.


## Checking Compatibility

This is a wrapper (with some additional niceties) for the system-installed Kuzu
shared library.  As such, the version of this library might not match with what
you currently have installed.

Check the [README](README.md), the [History](History.md), and the following
table to ensure you're using the correct version for your Kuzu
installation. I'll make a modest effort for backwards compatibility, and other
versions might work. Don't count too heavily on it.  :-)

| Kuzu Library Version | Nim Kuzu Version |
| -------------------- | ---------------- |
| v0.8.2               | v0.1.0           |

You can use the `kuzuVersionCompatible()` function (along with the
`KUZU_VERSION` and `KUZU_LIBVERSION` constants) to quickly check if things are
looking right.

```nim
import kuzu

echo KUZU_VERSION            #=> "0.1.0"
echo KUZU_LIBVERSION         #=> "0.8.2"
echo kuzuVersionCompatible() #=> true
```


## Connecting to a Database

Just call `newKuzuDatabase()`.  Without an argument (or with an empty string),
the database is in-memory.  Any other argument is considered a filesystem path
-- it will create an empty database if the path is currently non-existent, or
open an existing database otherwise.

```nim
# "db" is in-memory and will evaporate when the process ends.
var db = newKuzuDatabase()
```

```nim
# "db" is persistent, stored in the directory "data".
var db = newKuzuDatabase("data")
```
The database path is retained, and can be recalled via `db.path`.

```nim
db.path #=> "data"
```

### Database Configuration

The database is configured with default options by default.  You can see them
via:

```nim
echo $db.config
#=> (buffer_pool_size: 23371415552, max_num_threads: 16, ...

# Is compression enabled?
if db.config.enable_compression:
	echo "Yes!"
```

You can alter configuration options when connecting by passing a `kuzuConfig`
object as the second argument to `newKuzuDatabase()`:

```nim
# Open a readonly handle.
var db = newKuzuDatabase( "data", kuzuConfig( read_only=true ) )
```

### The Connection

All interaction with the database is performed via a connection object.  There
are limitations to database handles and connection objects -- see the
[Kuzu Concurrency](https://docs.kuzudb.com/concurrency/) docs for details!

Call `connect` on an open database handle to create a new connection:

```nim
var conn = db.connect
```

You can set a maximum query lifetime, and interrupt any running queries (thread
shutdown, ctrl-c, etc):

```nim
# Set a maximum ceiling on how long a query can run, in milliseconds.
conn.queryTimeout( 10 * 1000 ) # 10 seconds

# Cancel a running query.
conn.queryInterrupt()
```

## Performing Queries

You can perform a basic query via the appropriately named `query()` function on
the connection. Via this method, queries are run immediately.  A
`KuzuQueryResult` is returned - this is the object you'll be interacting with to
see results.

A `KuzuQueryResult` can be turned into a string to quickly see the column
headers and all tuple results:

```nim
var res = conn.query( """RETURN "Hello world", 1234, [1,2,3]""" )

echo $res #=>
# Hello world|1234|LIST_CREATION(1,2,3)
# Hello world|1234|[1,2,3]
```

Additionally, various query metadata is available for introspection:

```nim
var res = conn.query( """
RETURN
  "Hello world" AS hi,
  1234 AS pin,
  [1,2,3] AS list
""" )

echo res.num_columns    #=> 3
echo res.num_tuples     #=> 1
echo res.compile_time   #=> 14.028
echo res.execution_time #=> 1.624

# Return the column names as a sequence.
echo res.column_names #=> @["hi", "pin", "list"]

# Return the column data types as a sequence.
echo res.column_types #=> @[KUZU_STRING, KUZU_INT64, KUZU_LIST]
```

### Prepared Statements

If you're supplying an argument to a query, or you're running a query
repeatedly, it's safer and faster to create a prepared statement via `prepare()`
on the connection. These statements are only compiled once, and execution is
deferred until you call `execute()`.

```nim
var stmt = conn.prepare( """
RETURN
  "Hello world" AS hi,
  1234 AS pin,
  [1,2,3] AS list
""" )

# This returns a KuzuQueryResult, just like `conn.query()`.
var res = stmt.execute()
```

Arguments are labeled variables (prefixed with `$`) within the query.
Parameters are matched by providing a Nim tuple argument to `execute()` - a
simple round trip example:

```nim
var stmt = conn.prepare( """
RETURN
  $message AS message,
  $digits AS digits,
  LIST_CREATION($list) AS list
""" )

var res = stmt.execute( (message: "Hello", digits: 1234, list: "1,2,3") )

echo $res #=>
# message|digits|list
# Hello|1234|[1,2,3]
```

#### Type Conversion

When binding variables to a prepared statement, most Nim types are automatically
converted to their respective Kuzu types.

```nim
var stmt = conn.prepare( """RETURN $num AS num""" )
var res  = stmt.execute( (num: 12) )

echo res.column_types[0] #=> KUZU_INT32
```

This might not necessarily be what you want - sometimes you'd rather be strict
with typing, and you might be inserting into a column that has a different type
than the default.

You can use [integer type suffixes](https://nim-lang.org/docs/manual.html#lexical-analysis-numeric-literals), or casting to be explicit as usual:

```nim
var stmt = conn.prepare( """RETURN $num AS num""" )
var res: KuzuQueryResult

res = stmt.execute( (num: 12'u64) )
echo res.column_types[0] #=> KUZU_UINT32

res = stmt.execute( (num: 12.float) )
echo res.column_types[0] #=> KUZU_DOUBLE
```

#### Kuzu Specific Types

In the example above, you may have noticed the `LIST_CREATION($list)` in the
prepared query, and that we passed a string `1,2,3` as the `$list` parameter.

This is a useful way to easily use most Kuzu types without needing corresponding
Nim ones -- if you're inserting into a table that is using a custom type, you
can cast it using the query itself during insertion!

This has the additional advantage of letting Kuzu error check the validity of
the content, and it works with the majority of types.

An extended example:

```nim
import std/sequtils
import kuzu

var db   = newKuzuDatabase()
var conn = db.connect

var res: KuzuQueryResult

# Create a node table.
#
res = conn.query """
CREATE NODE TABLE Example (
  id SERIAL,
  num UINT8,
  done BOOL,
  comment STRING,
  karma DOUBLE,
  thing UUID,
  created DATE,
  activity TIMESTAMP,
  PRIMARY KEY(id)
)
"""

# Prepare a statement for adding a node.
#
var stmt = conn.prepare """
CREATE (e:Example {
  num: $num,
  done: $done,
  comment: $comment,
  karma: $karma,
  thing: UUID($thing),
  created: DATE($created),
  activity: TIMESTAMP($activity)
})
"""

# Add a node row that contains specific Kuzu types.
#
res = stmt.execute((
  num: 2,
  done: true,
  comment: "Types!",
  karma: 16.7,
  thing: "e0e7232e-bec9-4625-9822-9d1a31ea6f93",
  created: "2025-03-29",
  activity: "2025-03-29"
))

# Show the current contents.
res = conn.query( """MATCH (e:Example) RETURN e.*""" )
echo $res #=>
# e.id|e.num|e.done|e.comment|e.karma|e.thing|e.created|e.activity
# 0|2|True|Types!|16.700000|e0e7232e-bec9-4625-9822-9d1a31ea6f93|2025-03-29|2025-03-29 00:00:00

# Show column names and their Kuzu types.
for pair in res.column_names.zip( res.column_types ):
  echo pair #=>
  # ("e.id", KUZU_SERIAL)
  # ("e.num", KUZU_UINT8)
  # ("e.done", KUZU_BOOL)
  # ("e.comment", KUZU_STRING)
  # ("e.karma", KUZU_DOUBLE)
  # ("e.thing", KUZU_UUID)
  # ("e.created", KUZU_DATE)
  # ("e.activity", KUZU_TIMESTAMP)
```

## Reading Result Sets

So far we've just been showing values by converting the entire `KuzuQueryResult`
to a string.  Convenient for quick examples and debugging, but not much else.

A `KuzuQueryResult` is an iterator. You can use regular Nim functions that yield
each `KuzuFlatTuple` -- essentially, each row that was returned in the set.

```nim
var res = conn.query """
	UNWIND [1,2,3] AS items
	UNWIND ["thing"] AS thing
	RETURN items, thing
"""

# KuzuFlatTuple can be stringified just like the result set.
for row in res:
  echo row #=>
  # 1|thing
  # 2|thing
  # 3|thing
```

Once iteration has reached the end, it is automatically rewound for reuse.

You can manually get the next `KuzuFlatTuple` via `getNext()`.  Calling
`getNext()` after the last row results in an error.  Use `hasNext()` to check
before calling.

```nim
var res = conn.query """
	UNWIND [1,2,3] AS items
	RETURN items
"""

# Get the first row.
if res.hasNext:
  var row = res.getNext
  echo row #=> 1

echo res.getNext #=> 2
echo res.getNext #=> 3
echo res.getNext #=> KuzuIndexError exception!
```

Manually rewind the `KuzuQueryResult` via `rewind()`.


## Working with Values

A `KuzuFlatTuple` contains the entire row.  You can index a value at its column
position, returning a `KuzuValue`.

```nim
var res = conn.query """
RETURN
  1 AS num,
  true AS done,
  "A comment" AS comment,
  12.84 AS karma,
  UUID("b41deae0-dddf-430b-981d-3fb93823e495") AS thing,
  DATE("2025-03-29") AS created
"""

var row = res.getNext

for idx in ( 0 .. res.num_columns-1 ):
  var value = row[idx]
  echo res.column_names[idx], ": ", value, " (", value.kind, ")" #=>
  # num: 1 (KUZU_INT64)
  # done: True (KUZU_BOOL)
  # comment: A comment (KUZU_STRING)
  # karma: 12.840000 (KUZU_DOUBLE)
  # thing: b41deae0-dddf-430b-981d-3fb93823e495 (KUZU_UUID)
  # created: 2025-03-29 (KUZU_DATE)
```

### Types

A `KuzuValue` can always be stringified, irrespective of its Kuzu type.  You can
check what type it is via the 'kind' property.

```nim
var res = conn.query """RETURN "hello""""
var value = res.getNext[0]

echo value.kind #=> KUZU_STRING
```

A `KuzuValue` has conversion methods for Nim base types.  You'll likely want to
convert it for regular Nim usage:

```nim
var res = conn.query( "RETURN 2560" )
var value = res.getNext[0]

echo value + 1 #=> Type error!

echo $value #=> "2560"
echo value.toInt64 + 1 #=> 2561
```


### Lists

A `KuzuValue` of type `KUZU_LIST` can be converted to a Nim sequence of
`KuzuValues` with the `toList()` function:

```nim
import std/sequtils
import kuzu

var res = conn.query """
RETURN [10, 20, 30]
"""

var value = res.getNext[0]

var list = value.toList
echo list #=> @[10,20,30]

echo list.map( func(v:KuzuValue): int = v.toInt64 * 10 ) #=> @[100,200,300]
```


### Struct-like Objects

Various Kuzu types can act like a struct - this includes `KUZU_NODE`,
`KUZU_REL`, and of course explicit `KUZU_STRUCT` itself, among others.

Convert a `KuzuValue` to a `KuzuStructValue` with `toStruct()`.  For
convenience, this is also aliased to `toNode()` and `toRel()`.

Once converted, you can access struct values by passing the key name to `[]`:

```nim
var res = conn.query """
RETURN {movie: "The Fifth Element", year: 1997}
"""

var value = res.getNext[0]

var struct = value.toStruct
echo struct["movie"], " was released in ", struct["year"], "." #=>
# "The Fifth Element was released in 1997."
```

Here's a much more complicated example, following a node paths:

```nim
import
  std/sequtils,
  std/strformat
import kuzu

var db   = newKuzuDatabase()
var conn = db.connect

var res = conn.query """
    CREATE NODE TABLE Person (
      id SERIAL,
      name STRING, PRIMARY KEY (id)
    );
    CREATE REL TABLE Knows (
      FROM Person TO Person,
      since INT
    );

    CREATE (p:Person {name: "Bob"});
    CREATE (p:Person {name: "Alice"});
    CREATE (p:Person {name: "Bruce"});
    CREATE (p:Person {name: "Tom"});

    CREATE (a:Person {name: "Bruce"})-[r:Knows {since: 1997}]->(b:Person {name: "Tom"});
    CREATE (a:Person {name: "Bob"})-[r:Knows {since: 2009}]->(b:Person {name: "Alice"});
    CREATE (a:Person {name: "Alice"})-[r:Knows {since: 2010}]->(b:Person {name: "Bob"});
    CREATE (a:Person {name: "Bob"})-[r:Knows {since: 2003}]->(b:Person {name: "Bruce"});
"""

res = conn.query """
	MATCH path = (a:Person)-[r:Knows]->(b:Person)
	WHERE r.since > 2000
	RETURN r.since as Since, nodes(path) as People
	ORDER BY r.since
"""

# Who knows who since when?
#
for row in res:
  var since  = row[0]
  var people = row[1].toList.map( proc(p:KuzuValue):KuzuStructValue = p.toNode )
  echo &"""{people[0]["name"]} has known {people[1]["name"]} since {since}."""

```

