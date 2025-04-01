# SQL

# Employee Database Project - SQL Summary (Oracle Inspired)

This project implements a simplified employee database, inspired by the classic Oracle employee schema, using standard SQL. It focuses on core employee and department data, demonstrating fundamental SQL operations.

## Database Schema

The database consists of two tables:

* **department**:
    * `id` (INT, PRIMARY KEY): Unique identifier for each department.
    * `name` (VARCHAR(100)): Name of the department.
* **employee**:
    * `id` (INT, PRIMARY KEY): Unique identifier for each employee.
    * `department_id` (INT, FOREIGN KEY referencing `department.id`): Department the employee belongs to.
    * `chief_id` (INT, FOREIGN KEY referencing `employee.id`): ID of the employee's manager/chief (can be NULL).
    * `name` (VARCHAR(100)): Employee's name.
    * `salary` (DECIMAL(19, 2)): Employee's salary.

## SQL Operations

This project showcases the following SQL operations:

* **DDL (Data Definition Language):**
    * Creating tables (`CREATE TABLE`).
    * Defining primary keys (`PRIMARY KEY`).
    * Defining foreign keys (`FOREIGN KEY`).
    * Dropping tables (`DROP TABLE`).
    * Altering tables (`ALTER TABLE`).
* **DML (Data Manipulation Language):**
    * Inserting data (`INSERT INTO`).
* **DQL (Data Query Language):**
    * Retrieving data (`SELECT`).
    * Using foreign keys to relate tables.
    * Using Null values.

## Project Objectives

* To create a simple relational database for employee and department information.
* To demonstrate the basic use of SQL for creating and populating tables.
* To establish relationships between tables using foreign keys.
* To create a database that mirrors a well known example database, to aid in learning.

## Usage

1.  Clone the repository.
2.  Execute the SQL script in a compatible SQL database environment (e.g., PostgreSQL, SQL Server).
3.  Query the tables to retrieve employee and department information.

## Example Queries

* Retrieve all employees:

```sql
SELECT * FROM employee;
