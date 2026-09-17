
## Q: Define weak entity with example.
> *[SourceCOMPUTER SCIENCE G DSE-A-I 2022, Q1(b)]*

**Answer:** A **weak entity set** is an entity set that does not possess sufficient attributes to form a primary key of its own[51]. It depends on an **identifying owner entity set** for its existence and is uniquely identified by combining the primary key of its owner with its own **partial key (discriminator)**[50].

* **Example:** `DEPENDENT` is a weak entity set dependent on `EMPLOYEE` (owner)[96]. A dependent is identified by combining `SSN` of `EMPLOYEE` and `Dependent_Name` (partial key)
---
## Q: Explain derived attribute and multivalued attribute with example.
> *(Source: COMPUTER SCIENCE G DSE-A-I 2022, Q1(c))*

**Answer:**

* **Derived Attribute:** An attribute whose value is not stored directly in the database, but is computed dynamically from related stored attributes or system values.
  * **Example:** `Age` calculated from `Date_of_Birth`[13][17]. Symbolized by a dashed oval.
* **Multivalued Attribute:** An attribute that can hold more than one value for a single entity instance.
  * **Example:** `{Phone_Numbers}` or `{College_Degrees}` of an employee[13]. Symbolized by a double oval

---
## Q:  (a) What are the components of ER diagram? |  (b) What are the different types of relationship that can be present in an ER model? | (c) Construct an ER diagram to store data in a library of your college.** 
> *(Source: COMPUTER SCIENCE G DSE-A-I 2022, Q3(a,b,c))*

**Answer:** **(a) Key Components of ER Diagram:**

1. **Entity Sets:** Represented by Rectangles (Strong Entity) and Double Rectangles (Weak Entity).
2. **Attributes:** Represented by Ovals (Simple), Double Ovals (Multivalued), Dashed Ovals (Derived), and Underlined Text (Primary Key).
3. **Relationships:** Represented by Diamonds (Normal) and Double Diamonds (Identifying).
4. **Lines/Arcs:** Connect attributes to entities and entities to relationships; double lines signify total participation.

**(b) Types of Relationships by Degree &amp; Cardinality:**

* **By Degree:** Unary/Recursive (degree 1), Binary (degree 2), Ternary (degree 3), and N-ary.
* **By Cardinality Ratio:** 1:1, 1:N, N:1, and M:N.

**(c) College Library ER Diagram Representation:**

```
 [STUDENT] (RollNo [PK], Name, Dept) 
    │
    │ (1:N, Partial)
    ▼
 <BORROWS> (Issue_Date, Return_Date, Fine)
    ▲ 
    │ (M:N, Total)
    │ 
  [BOOK] (BookID [PK], Title, Author, Publisher, Price)
```
*  **Entities:** `STUDENT` (RollNo, Name, Branch) and `BOOK` (BookID, Title, Author, Price)[103].
* **Relationship:** `BORROWS` (M:N ratio) with descriptive attributes `Issue_Date`, `DueDate`, and `Fine`.
---

## Q: What do you understand by composite attributes?**
> *(Source: DSE-A1 2023, Q1(c))*

**Answer:** A **composite attribute** is an attribute that can be divided into smaller subparts or component attributes that have independent meanings of their own.

* **Example:** `Name` can be divided into `(First_Name, Middle_Initial, Last_Name)`[16][104], and `Address` into `(Street, City, State, Zip)`
---
## Q: What are the different types of mapping cardinalities in ER-diagram?**
> *(Source: DSE-A1 2023, Q3(a))*

**Answer:** Mapping cardinalities express the maximum number of entity instances to which another entity can be associated via a binary relationship set:

1. **One-to-One (1:1):** An entity in A is associated with at most one entity in B, and vice versa.
2. **One-to-Many (1:N):** An entity in A is associated with any number of entities in B, but B is associated with at most one entity in A.
3. **Many-to-One (N:1):** An entity in A is associated with at most one entity in B, but B can be associated with many in A.
4. **Many-to-Many (M:N):** Entities in both A and B can be associated with any number of entities in the other set.
---
## Q: Explain Specialization and Generalization with suitable examples.**
> *(Source: COMPUTER SCIENCE G DSE-A-I 2022 Q6(b) / 2018 Q7(b))*

**Answer:**

* **Specialization (Top-Down):** The process of creating subgroupings/subclasses within an entity set based on distinguishing features.
  * **Example:** Entity `EMPLOYEE` specialized into `SECRETARY`, `ENGINEER`, and `TECHNICIAN`.
* **Generalization (Bottom-Up):** The process of combining multiple entity sets that share common attributes into a single generalized superclass.
  * **Example:** Combining `CAR` (attributes: Price, License\_Plate, Max\_Speed) and `TRUCK` (attributes: Price, License\_Plate, No\_of\_Axles) into superclass `VEHICLE`.

---
## Q: Define ternary relationship with example.**
> *(Source: DSE-A1 2023, Q7(b))*

**Answer:** A **ternary relationship** is a relationship set of degree 3, involving three distinct participating entity types simultaneously.

* **Example:** `SUPPLY` relationship associating `SUPPLIER`, `PART`, and `PROJECT`. It records that Supplier *S* supplies Part *P* to Project *J*.  