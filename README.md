
# Nim Kuzu

home
: https://code.martini.nu/fossil/nim-kuzu

github_mirror
: https://github.com/mahlonsmith/nim-kuzu


## Description

This is a Nim binding for the [Kuzu](https://kuzudb.com) graph database library.

Kuzu is an embedded graph database built for query speed and scalability. It is
optimized for handling complex join-heavy analytical workloads on very large
graphs, with the following core feature set:

- Property Graph data model and Cypher query language
- Embedded (in-process) integration with applications
- Columnar disk-based storage
- Columnar, compressed sparse row-based (CSR) adjacency list/join indices
- Vectorized and factorized query processor
- Novel and very fast join algorithms
- Multi-core query parallelism
- Serializable ACID transactions

For more information about Kuzu itself, see its
[documentation](https://docs.kuzudb.com/).


## Prerequisites

* A functioning Nim >= 2 installation
- [KuzuDB](https://kuzudb.com) to be locally installed!


## Installation

    $ nimble install kuzu

The current version of this library is built for Kuzu v0.9.0.


## Usage

See the [Usage documentation](USAGE.md).

You can also find a bunch of working examples in the tests.


## Contributing

You can check out the current development source with Fossil via its [home
repo](https://code.martini.nu/fossil/nim-kuzu), or with Git/Jujutsu at its
[project mirror](https://github.com/mahlonsmith/nim-kuzu)

After checking out the source, uncomment the development dependencies
from the `kuzu.nimble` file, and run:

    $ nimble setup

This will install dependencies, and do any other necessary setup for
development.



## Authors

- Mahlon E. Smith <mahlon@martini.nu>

A note of thanks to @mantielero on Github, who has a Kuzu binding for an early
KuzuDB (0.4.x) that I found after starting this project.

