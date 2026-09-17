##  Introduction &amp; Drawbacks of Legacy File Systems

###  Fundamental Definitions

* **Data:** Known facts that can be recorded and have implicit meaning. For example, student names, phone numbers, or course grades[1].
* **Database:** A logically coherent collection of related data with inherent meaning, designed for a specific purpose to represent some aspect of the real world (known as the **miniworld** or **universe of discourse (UoD)**). Changes in the real-world miniworld are immediately reflected in the database.
* **Database Management System (DBMS):** A general-purpose software package that facilitates defining, constructing, manipulating, and sharing databases among users and applications.
* **Database System:** The database and DBMS software combined with the application programs written to access it
---

### Q: Compare traditional file-processing systems with the DBMS approach. What are the key advantages of a DBMS?

Traditional file-processing systems store data in separate computer files managed by individual departmental applications.

**Drawbacks of File Systems vs. DBMS Advantages:**

1. **Redundancy &amp; Inconsistency:** File systems store duplicate data across departments, leading to inconsistent values. A DBMS centralizes data, maintaining **consistency** through normalized storage.
2. **Program-Data Dependence:** In file systems, file structures are hardcoded into application programs. In a DBMS, file definitions are stored separately in the catalog, providing **program-data independence**.
3. **Security:** File systems lack central access control. A DBMS provides a **security subsystem** with account passwords and permissions.
4. **Concurrent Access &amp; Integrity:** File systems restrict concurrent multi-user edits. A DBMS includes **concurrency control** and automatically enforces **integrity constraints** (e.g., foreign keys)
---
### Q: Distinguish between Database Schema and Database State (Intension vs. Extension)
**Answer:**

* **Database Schema (Intension):** The logical design, structure, and constraints of the database specified during database design. It changes very infrequently.
* **Database State / Instance (Extension):** The actual collection of data records stored in the database at a particular moment in time. It changes frequently whenever records are inserted, updated, or deleted.

---
### Q: Differentiate between Procedural and Non-procedural Data Manipulation Languages (DMLs).
**Answer:**

* **Nonprocedural DML (Declarative / High-Level):**
  * The user specifies **what** data is needed without specifying *how* to retrieve it.
  * Operates on sets of records (**set-at-a-time**).
  * **Example:** **SQL** queries (`SELECT * FROM STUDENT WHERE Class = 1;`).
* **Procedural DML (Low-Level / Navigational):**
  * The user specifies **what** data is needed and explicitly details **how** to navigate and retrieve it step-by-step.
  * Embedded in programming languages and operates on individual records (**record-at-a-time**).
  * **Example:** DL/1 in hierarchical databases using `GET NEXT` loops

---
### Q: Define Metadata with a suitable example.
**Answer:** **Metadata** is defined as "data about data". It is the descriptive information stored in the DBMS catalog/data dictionary that defines the structure, data types, file formats, relationships, and constraints of the primary database.

* **Example:** In a `STUDENT` table, the actual name `"Alice"` is data, whereas specifying that the `Name` column is `Character(30)` and `Student_Number` is an `Integer` primary key is **metadata**

---

### Q: Discuss any three main types of data models used in DBMS.
**Answer:** A data model is a collection of concepts used to describe the structure and constraints of a database[58]. Three main categories are:

1. **High-Level / Conceptual Data Models:**
    - These models provide concepts that are close to how users perceive data.
    - **Example:** The **Entity-Relationship (ER) Model**, which uses entities (real-world objects like `Student`), attributes (properties like `Age`), and relationships (e.g., `Enrolled_In`).
2. **Representational / Implementation Data Models:**
    - These are record-based models used most frequently in commercial DBMSs[63][64]. They hide low-level disk details but can be directly implemented on a computer.
    - **Example:** The **Relational Data Model**, which represents data and relationships as two-dimensional tables (relations) consisting of rows (tuples) and columns (attributes).
3. **Low-Level / Physical Data Models:**
    - These describe how data is physically stored as files on computer storage media (disks).
    - **Example:** Physical specifications including record formats, byte offsets, ordering, and secondary access paths like **B-tree indexes** or **hash tables**