// vim: set noet sta sw=4 ts=4 :
/*

Minimal reproduction test case for what seems like
weird prepared statement binding behavior?

I don't know.  Maybe it's just me.

NOTE: This was verified and fixed in Kuzu 0.9.0!

https://docs.kuzudb.com/get-started/prepared-statements/

    % clang -lkuzu -o prepared-test prepared-test.c

*/

#include <stdio.h>
#include <kuzu.h>

int main()
{
	/* Setup */
	kuzu_system_config config = kuzu_default_system_config();
	kuzu_database db;
	kuzu_database_init( "TEST-DB", config, &db );

	kuzu_connection conn;
	kuzu_connection_init( &db, &conn );

	kuzu_query_result q;
	kuzu_prepared_statement stmt;

	char things[3][20] = { "Camel", "Lampshade", "Delicious Cake" };


	/* Schema install */
	if ( kuzu_connection_query(
		&conn,
		"CREATE NODE TABLE Test ( id SERIAL, thing STRING, PRIMARY KEY(id) )",
		&q ) != KuzuSuccess ) {
		printf( "Couldn't create schema?!\n" );
		return 1;
	}


	/* Prepare statement */
	if ( kuzu_connection_prepare(
		&conn,
		"CREATE (t:Test {thing: $thing})",
		&stmt
		) != KuzuSuccess ) {
		printf( "Couldn't prepare statement?\n" );
		return 1;
	}


	/* Lets make some nodes using the prepared statement. */
	for ( int i = 0; i < 3; i++) {
		printf( "Binding thing: %s\n", things[i] );
		if ( kuzu_prepared_statement_bind_string( &stmt, "thing", things[i] ) != KuzuSuccess ) {
			printf( "Unable to bind thing: %s\n", things[i] );
		}
		if ( kuzu_connection_execute( &conn, &stmt, &q ) != KuzuSuccess ) {
			printf( "Couldn't execute prepared statement.\n" );
		}
	}

	/* Cleanup */
	kuzu_prepared_statement_destroy( &stmt );
	kuzu_query_result_destroy( &q );
	kuzu_connection_destroy( &conn );
	kuzu_database_destroy( &db );

	/* HMM */
	printf( "Okay.  Now 'kuzu TEST-DB' and look around.\n" );
	printf( "\"MATCH (t:Test) RETURN t.thing;\", perhaps.\n\n" );
	printf( "I'd expect to see what I thought I bound.\n" );
	printf( "Instead, I see three Camels.\n" );
	printf( "Too many camels!!\n" );

	return 0;
}

