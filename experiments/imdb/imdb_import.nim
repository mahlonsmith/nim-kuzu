# vim: set et sta sw=4 ts=4 :
#
# Fetches movie and actor data from IMDB and converts it
# to CSV, then imports into a Kuzu graph database.
#
# Only cares about actors in movies!  Things like writers,
# directors, and TV shows are intentionally omitted.
#
# Compile:
#   % nim c -d:release imdb_import.nim
#
# Sourced from: https://datasets.imdbws.com/
# See: https://developer.imdb.com/non-commercial-datasets/

import
    std/os,
    std/sequtils,
    std/strformat,
    std/strutils,
    zip/gzipfiles,
    kuzu

const DB     = "imdb"
const SOURCE = "https://datasets.imdbws.com"
const FILES  = @[ "name.basics", "title.basics", "title.principals" ]

#
# Prep everything!
#
for file in FILES:
    var c     = 0
    let tsvgz = &"{file}.tsv.gz"
    let csv   = &"{file}.csv"

    if csv.fileExists:
        echo &"Skipping {file}, csv already exists."
        continue

    if not tsvgz.fileExists:
        echo &"Downloading file: {file}..."
        discard execShellCmd &"wget {SOURCE}/{tsvgz}"

    let tsv_stream = newGzFileStream( tsvgz )
    let csv_file = open( &"{file}.csv", fmWrite )

    case file
        of "name.basics":
            csv_file.write( "aid,name,birthYear,deathYear\n" )
        of "title.basics":
            csv_file.write( "mid,title,year,durationMins\n" )
        of "title.principals":
            csv_file.write( "aid,mid\n" )

    var line = ""
    while tsv_stream.readLine( line ):
        try:
            c += 1
            if c mod 1000 == 0: stderr.write( &"Parsing {file}... {c}\r" )

            var row = line.split( '\t' )
            case file

                # nconst primaryName birthYear deathYear primaryProfession knownForTitles
                of "name.basics":
                    row = row[0..3]
                    row[0] = $row[0].replace( "nm" ).parseInt()

                # tconst titleType primaryTitle originalTitle isAdult startYear endYear runtimeMinutes genres
                of "title.basics":
                    if row[1] != "movie": continue
                    row.delete( 1 )
                    for i in 0..1: row.delete( 2 )
                    row.delete( 3 )
                    discard row.pop()
                    row[0] = $row[0].replace( "tt" ).parseInt()

                # tconst ordering nconst category job characters
                of "title.principals":
                    if row[3] != "actor" and row[3] != "actress": continue
                    row.delete( 1 )
                    row = row[0..1]
                    row[0] = $row[0].replace( "tt" ).parseInt()
                    row[1] = $row[1].replace( "nm" ).parseInt()
                    row = @[ row[1], row[0] ]


            if file.contains( ".basics" ):
                row.applyIt(
                    # empty value / null
                    if it == "\\N": ""

                    # RFC 4180 escapes
                    elif it.contains( "\"" ) or it.contains( ',' ):
                        var value = it
                        value = value.replace( "\"", "\"\"" )
                        value = value.replace( ",", "" )
                        "\"" & value & "\""

                    else: it
                )

            csv_file.write( row.join(","), "\n" )

        except ValueError:
            continue

    tsv_stream.close()
    csv_file.close()
    stderr.write( "\n" )


#
# Ok, now import into a fresh kuzu database.
#

if not DB.dirExists:
    var db   = newKuzuDatabase( DB )
    var conn = db.connect()
    var duration = 0

    for schema in @[
        """CREATE NODE TABLE Actor (actorId INT64, name STRING, birthYear UINT16, deathYear UINT16, PRIMARY KEY (actorId))""",
        """CREATE NODE TABLE Movie (movieId INT64, title STRING, year UINT16, durationMins INT, PRIMARY KEY (movieId))""",
        """CREATE REL TABLE ActedIn (FROM Actor TO Movie)"""
    ]:
        var q = conn.query( schema )
        duration += q.execution_time.int

    echo &"Created database schema in {duration}ms."
    duration = 0

    for dataload in @[
        """COPY Actor FROM "./name.basics.csv" (header=true)""",
        """COPY Movie FROM "./title.basics.csv" (header=true)""",
        """COPY ActedIn FROM "./title.principals.csv" (header=true, ignore_errors=true)"""
    ]:
        echo dataload
        var q = conn.query( dataload )
        duration += q.execution_time.int

    echo &"Imported data in {duration / 1000}s."
    echo "Done!"

else:
    echo &"Database appears to already exist, skipping data import."

