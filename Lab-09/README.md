# JDBC

## Introduction

* Java™ database connectivity is a Java API for communicating with database systems supporting SQL. 
* JDBC supports a variety of features for querying and updating data, and for retrieving queries. 
* JDBC also supports metadata retrieval, such as querying about relations present in the database and the names and types of the relation attributes.
* Model for communicating with the database
  * Open a connection
  * Create a statement object
* Execute queries using the statement object to send queries and fetch results.
* It also provides exception mechanism to handle errors.

## JDBC Features:

* Connecting to Database
* DB access in Java/Python
* Shipping SQL statements to the Database System
* Exceptions and Resource Management.
* Retrieving the Result of a Query
* Prepared Statements
* Callable statements
* Metadata Features
* Transaction Control
* Calling functions and procedures
* Handling large objects - BLOBs, CLOBs.

## Why does a database programmer need access to a general-purpose programming language?

* Not all queries can be expressed in SQL, since SQL does not provide the full  expressive power of a general-purpose programming language.
* Non-declarative actions such as printing a report, interacting with a user, or sending the results of a query to a GUI cannot be done from within the SQL.

## There are two approaches to access SQL from a General-Purpose Programming Language?

* A general-purpose program can connect to and communicate with a database server using a collection of functions
* Embedded SQL provides a means by which a program can interact with a database server.
 * SQL statement can be translated at compile time into function calls
 * At runtime, these function calls connect to the database using an API that provides dynamic SQL facilities


