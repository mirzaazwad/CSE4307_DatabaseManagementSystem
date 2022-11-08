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
 
 ## Basic Structure of JDBC Code
 
 ```java
 public static void JDBCexample(String dbid, String userid, String passwd) 
{ 
 try (Connection conn = DriverManager.getConnection( 
  "jdbc:oracle:thin:@db.yale.edu:2000:univdb", userid, passwd); 
  Statement stmt = conn.createStatement();
 ) 
 { 
 … Do Actual Work ….
 }
 catch (SQLException sqle) { 
  System.out.println("SQLException : " + sqle);
 }
}
 ```
 
 Note: This structure works from JDK 7 and JDBC 14 onwards. Resources opened in “try (….)” syntax (“try with resources”) are 
automatically closed at the end of the try block. The code given below works for older versions of java. Class.forName is not required from JDBC 4 onwards. The try with resources syntax given above is preferred for Java 7 onwards. 

 
 ```java
public static void JDBCexample(String dbid, String userid, String passwd) 
{ 
 try { 
  Class.forName ("oracle.jdbc.driver.OracleDriver"); 
  Connection conn = DriverManager.getConnection( 
  "jdbc:oracle:thin:@db.yale.edu:2000:univdb", userid, passwd); 
  Statement stmt = conn.createStatement(); 
  … Do Actual Work ….
  stmt.close();
  conn.close();
 }
 catch (SQLException sqle) { 
  System.out.println("SQLException : " + sqle);
 }
}
```
## Database Queries using JDBC

#### Update to the Database

```java
try {
 stmt.executeUpdate(
 "insert into instructor values('77987', 'Kim', 'Physics', 98000)");
 } catch (SQLException sqle)
{
 System.out.println("Could not insert tuple. " + sqle);
}
```

#### Execute Query and Fetch Print Results

```java
ResultSet rset = stmt.executeQuery(
"select dept_name, avg (salary)
from instructor
group by dept_name");
while (rset.next()) {
System.out.println(rset.getString("dept_name") + " " +
rset.getFloat(2));
}

```
#### Getting Result Fields

```java
rs.getString(“dept_name”); //and 
rs.getString(1); //equivalent if dept_name is the first argument of select result
```

#### Dealing with NULL Values

```java
int a = rs.getInt(“a”);
if (rs.wasNull())
{
 Systems.out.println(“Got null value”);
}
```
## SQL Injection and its Prevention using Prepared Statements

![SQL Injection Meme](https://github.com/mirzaazwad/CSE4307_DatabaseManagementSystem/blob/main/Lab-08%20JDBC%20Tutorial/SQLInjectionMeme.jpg)

In computing, SQL injection is a code injection technique used to attack data-driven applications, in which malicious SQL statements are inserted into an entry field for execution (e.g. to dump the database contents to the attacker). SQL injection must exploit a security vulnerability in an application's software, for example, when user input is either incorrectly filtered for string literal escape characters embedded in SQL statements or user input is not strongly typed and unexpectedly executed. SQL injection is mostly known as an attack vector for websites but can be used to attack any type of SQL database.

A step by step introduction:

* Suppose a query is constructed of the form:
```java
"select * from instructor where name = '" + name + "'"
```
* Suppose the user enters:
```sql
X' or 'Y' = 'Y
```
* Then the resulting statement becomes:
 
