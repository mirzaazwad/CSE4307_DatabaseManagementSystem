# PL/SQL

PL stands for Procedural Language and SQL for Structured Query Language, PL/SQL is essentially a procedural language for structured query language. In this segment, we explore the PL/SQL for oracle sql.

## Blocks
Block: Smallest unit of code

In PL/SQL, as in most procedural languages, the **smallest meaningful grouping of code** is known as a block. A block is a unit of code that provides **execution and scoping boundaries for variable declarations and exception handling**.

#### Anonymous Blocks

Essentially, it has no Name

Anonymous blocks don't have a name and hence it cannot be called by any other block since it doesn't have a handle for reference. Instead, anonymous blocks serve as  containers that execute PL/SQL statements. It is not in the database and cannot be reused.(_one-time execution_).

Let's do the mandatory thing to start out with any new programming language:
```oracle
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello World!');
END ;
```

#### Named Blocks

While anonymous PL/SQL blocks are indispensable, the majority of code you write will be in names blocks that is:
* Functions
* Procedures
It is stored in the database and can be reused.

## Conditional Statements

**if then** is the most primitive of conditional statements. It can be written as: 
```oracle
IF <condition-1> THEN
 --TRUE sequence of executable statements for condition-1
ELSIF <condition-2> THEN
 --TRUE sequence of executable statements for condition-2
ELSE
  --FALSE/NULL sequence of executable statements
END IF ;
```

## Function

#### Why use function/procedure?
Modular code using a function has the following benefits:
* More reusable
* More manageable
* More readable

Structure of a Function:
```oracle
FUNCTION [schema]name[( parameter[, parameter ...])]
RETURN return_datatype
IS
[declaration statements]
BEGIN
<executable statements with a return>
[EXCEPTION
exception handler statements]

END [name];
```
