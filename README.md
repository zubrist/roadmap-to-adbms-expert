1. **Database Basics**

## Relational Database ##
>A relational database is a collection of data points with >pre-defined relationships between them.
>
>>The relational model organizes data into tables — with each row representing an individual record and each column consisting of attributes that contain values. This tabular database structure makes it easy to establish relationships between data points so  that the information can be accessed in a variety of different ways without reorganizing the data itself.

### Why Relational Database? ###
>Since the invention of computers, managing and storing data on machines has been an ongoing field of research. Before relational databases, organizations used a hierarchical database system, similar to folders on your computer. These early database systems could organize large volumes of data. However, they were limited in how you could uncover data relationships. They were also complex, proprietary to particular applications, and required technical expertise to work with.

>The relational database model emerged as a solution to these problems. It separated physical data storage from database management and usage. Modern relational databases let users store and retrieve data without having to manage physical data storage. You can also manipulate logical data structures programmatically.

### Benefits of Relational Database ###
>1. **Data Integrity:** The relational database model ensures data integrity by enforcing constraints on the data. For example, you can set a constraint that ensures a value in a column is unique, or that a value in a column is not null.
>2. **Data Security:** Relational databases provide data security by allowing you to set permissions on data. For example, you can set permissions so that only authorized users can access certain data.
>3. **Data Scalability:** Relational databases are designed to handle large volumes of data and can be scaled up or down as needed.
>4. **Data Consistency:** Relational databases ensure data consistency by enforcing referential integrity. This means that if a value in one table is referenced in another table, the value must be consistent across both tables.
>5. **Data Recovery:** Relational databases provide data recovery capabilities. If a database is corrupted, you can restore it to a previous state using a backup.

### Types of Relational Database ###
>1. **SQL Server:** Developed by Microsoft, SQL Server is a popular relational database management system (RDBMS) that supports both relational and non-relational data.
>2. **Oracle:** Oracle is a relational database management system that supports both relational and non-relational data. It is known for its scalability and performance.
>3. **MySQL:** MySQL is a popular open-source relational database management system that is known for its ease of use and flexibility.
>4. **PostgreSQL:** PostgreSQL is a powerful, open-source relational database management system that is known for its robustness and flexibility.

### Difference between relational and non-relational database ###
>1. **Data Model:** Relational databases use a tabular data model, while non-relational databases use a variety of data models, including key-value, document, columnar, and graph.
>2. **Data Storage:** Relational databases store data in tables, while non-relational databases store data in a variety of formats, including JSON, XML, and binary.
>3. **Query Language:** Relational databases use SQL (Structured Query Language) for querying data, while non-relational databases use a variety of query languages, including NoSQL query languages.
>4. **Scalability:** Relational databases are typically vertically scalable, while non-relational databases are horizontally scalable.
>5. **Data Consistency:** Relational databases enforce data consistency through referential integrity, while non-relational databases do not enforce data consistency.




2. **Set up SQL Environment**
>1. Install SQLite extension
>2. set up a database file -> db.sqlite3
>3. schema.sql file for table creation
>4. seed.sql file to insert data into the table
>5. run the query_runner.py file
>
>
3. **Basic SQL Queries**
#### *GOAL:* learn basic CRUD operations 
> See notebooks/basic_queries.ipynb

4. **Database Design and Normalization**
#### *GOAL:* learn how to design a database and normalize it
>1NF (First Normal Form)
>>No multi-valued attributes (phone numbers are in a separate table)Every column holds atomic values.

>2NF (Second Normal Form)
>>No partial dependencies (Course name removed from enrollments).Every non-key column fully depends on the primary key.

>3NF (Third Normal Form)
>>No transitive dependencies (Department name moved to departments table). Every column depends only on the primary key.

> See notebooks/database_design.ipynb

