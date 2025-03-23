
# Nim Kuzu

home
: https://code.martini.nu/fossil/nim-kuzu

github_mirror
: https://github.com/mahlonsmith/nim-kuzu


## Description

This is a Nim binding for the Kuzu graph database library.

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
- [KuzuDB](https://kuzudb.com)


## Installation

    $ nimble install kuzu


## Usage


> [!TODO]- Human readable usage docs!
>
> ... The nim generated source isn't great when pulling in
> the C wrapper auto-gen stuff.
>
> If you're here and reading this before I have proper docs written, see the
> tests/ for some working examples.



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


## License

Copyright (c) 2025 Mahlon E. Smith
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the author/s, nor the names of the project's
  contributors may be used to endorse or promote products derived from this
  software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

