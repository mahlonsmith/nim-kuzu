# vim: set et sta sw=4 ts=4 :
#
# Find links between two actors, via other actors
# they've worked with across movies.
#
# Outputs to screen, and generates a dot file with
# results for graphviz visualization.
#
# Compile:
#   % nim c -d:release imdb_find_actor_path.nim
#
# Run the "imdb_import" utility before using this!
#

import
    std/math,
    std/os,
    std/sequtils,
    std/strutils,
    std/strformat
import kuzu

const DB = "imdb"
const DOT = "imdb-results.dot"

if not DB.dirExists:
    echo """Cowardly refusing to run without an imdb database.
    (see: imdb_import in this directory.)"""
    quit 1

if paramCount() < 2:
    echo "I require 2 actor names, in quotes."
    quit 1

var stmt: KuzuPreparedStatement
var res:  KuzuQueryResult

var fromActor = paramStr(1)
var toActor   = paramStr(2)

var db = newKuzuDatabase( "imdb", kuzuConfig(read_only=true) )
var conn = db.connect

echo "Database opened: ", db.path

stmt = conn.prepare( "MATCH (a:Actor {name:$actor}) RETURN count(a)" )
res  = stmt.execute( (actor: fromActor) )
if res.getNext[0].toInt64 < 1:
    echo "Couldn't find actor ", &"\"{fromActor}\"."
    quit 1

stmt = conn.prepare( "MATCH (a:Actor {name:$actor}) RETURN count(a)" )
res  = stmt.execute( (actor: toActor) )
if res.getNext[0].toInt64 < 1:
    echo "Couldn't find actor ", &"\"{toActor}\"."
    quit 1

stmt = conn.prepare """
    MATCH (a:Actor {name:$fromActor})
    MATCH (b:Actor {name:$toActor})
    MATCH path = (a)-[r:ActedIn* ALL SHORTEST]-(b)
    RETURN DISTINCT nodes(path) AS nodes, length(path) AS hops
    ORDER BY hops
"""
stdout.write &"Finding paths from {fromActor} to {toActor}... "
stdout.flushFile
res = stmt.execute( (fromActor: fromActor, toActor: toActor) )

if res.num_tuples == 0:
    echo "Unable to find any paths!"
    quit 1


let dotFile = DOT.open( fmWrite )
dotFile.write "strict digraph {\n"
dotfile.write &"""
graph[
    rankdir=LR,
    size="8.5,11",
    margin=0.4,
    label="Tracing from \"{fromActor}\" to \"{toActor}\""
];
node [
    fontname=Arial
];""", "\n\n"

var fastestPath = res.getNext[1].toInt64
echo &"{round(res.execution_time / 1000, 2)} seconds, ",
    "fastest path in ", fastestPath, " hop(s).\n"
res.rewind

# 1st pass, get all nodes for per-node styles
#
var nodes: seq[ tuple[kind: char, label: string] ] = @[]
for row in res.items:
    for rawNode in row[0].toList:
        var node = rawNode.toNode
        var kind = $node["_LABEL"]
        case kind:
            of "Actor":
                nodes.add( (kind: 'a', label: $node["name"]) )
            of "Movie":
                nodes.add( (kind: 'm', label: $node["title"]) )
            else:
                discard

# Pre-define unique node styles
#
for node in nodes.deDuplicate():
    case node.kind:
        of 'a':
            dotFile.write( &"\"{node.label}\" " )
            if node.label == fromActor or node.label == toActor:
                dotFile.write """[shape=box, style=rounded, penwidth=3.0];""", "\n"
            else:
                dotFile.write """[shape=box, style=rounded];""", "\n"
        of 'm':
            dotFile.write( &"\"{node.label}\" " )
            dotFile.write """[shape=note];""", "\n"
        else:
            discard

# 2nd pass: emit relations to stdout and create dot links
#
dotFile.write "\n\n"
if res.num_tuples > 1:
    echo res.num_tuples, " tied ", fastestPath, " hop paths:"
for row in res.items:
    var output: string
    var pathLen = row[1].toInt64
    var pathStep = 0

    for rawNode in row[0].toList:
        pathStep += 1
        var node = rawNode.toNode
        if $node["_LABEL"] == "Actor":
            output.add $node["name"]
            dotFile.write &""""{$node["name"]}""""
            if pathStep == 1:
                output.add " was in "
                dotFile.write " -> "
            elif pathStep < pathLen:
                output.add " who was in "
                dotFile.write " -> "
                dotFile.write "\n"
            else:
                dotFile.write ";\n"
        elif $node["_LABEL"] == "Movie":
            output.add &""""{$node["title"]}""""
            output.add " with "
            dotFile.write &""""{$node["title"]}""""
            dotFile.write " -> \n"
    echo &"{output}."

dotFile.write "}\n"
dotFile.close
echo "\n\nYou can run 'dot -Tpdf < imdb-results.dot > imdb-results.pdf' if you have graphviz installed."


