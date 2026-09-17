# Chapter 2: Entity Relationship (ER) Modeling – 

### 1\. Entities &amp; Entity Sets

* **Entity:** A "thing" or object in the real world with an independent existence that is distinguishable from other objects[1]. It can have a physical existence (e.g., a person, car) or a conceptual existence (e.g., a university course, job)[1][4].
* **Entity Set:** A collection (or set) of similar entities that share the same properties or attributes[4].
  * **Intension (Schema):** The structural description of the entity type[8][9].
  * **Extension (State):** The collection of actual entity instances stored in the database at a specific moment[6].

> **Student Analogy:** `STUDENT` is an entity type (the blueprint/class). A specific student, "Rahul", is an entity occurrence. The entire group of enrolled students today is the entity set.

---

### 2\. Attributes &amp; Attribute Classification

Attributes are properties that describe an entity.

```
                 ┌────────────────────────────────────────┐
                 │             ATTRIBUTES                 │
                 └───────────────────┬────────────────────┘
          ┌──────────────────────────┼──────────────────────────┐
          ▼                          ▼                          ▼
  Simple vs Composite       Single vs Multivalued       Stored vs Derived
 (Atomic vs Component)        (1 value vs Set)         (Base vs Computed)

```

1. **Simple (Atomic) Attribute:** Cannot be divided into smaller subparts (e.g., `Salary`, `Age`).
2. **Composite Attribute:** Can be subdivided into smaller independent component attributes (e.g., `Address` split into `Street`, `City`, `State`, `Zip`).
3. **Single-Valued Attribute:** Holds a single value for a given entity (e.g., `SSN`, `Gender`).
4. **Multivalued Attribute:** Holds a set of values for a single entity (e.g., `{College_Degrees}`, `{Phone_Number}`).
5. **Derived Attribute:** Attribute whose value is calculated from a related stored attribute (e.g., `Age` derived from `Birth_Date`).
6. **Complex Attribute:** Arbitrarily nested composite and multivalued attributes (e.g., `{Address_Phone(Address, {Phone})}`).
7. **NULL Values:** Represents missing, unknown, or non-applicable values (e.g., `Apartment_Number` for a single-family house).

---

### 3\. Relationships, Degree &amp; Roles

* **Relationship &amp; Relationship Set:** An association or link among two or more entities[11]. A relationship set is a set of relationship instances of the same type.
* **Degree of a Relationship:** The number of participating entity types in a relationship.
  * **Unary / Recursive:** Same entity participates twice in different roles (e.g., an `EMPLOYEE` supervises another `EMPLOYEE`).
  * **Binary:** Degree 2 — relates two entity types (e.g., `STUDENT` enrolled in `COURSE`).
  * **Ternary:** Degree 3 — relates three entity types (e.g., `SUPPLIER`, `PART`, and `PROJECT`).
* **Role Names:** Explicit labels assigned to relationship lines when the same entity participates more than once in a recursive relationship (e.g., `Supervisor` vs. `Supervisee`).

---

### 4\. Keys in ER Modeling

* **Superkey:** A set of one or more attributes that collectively identifies an entity uniquely.
* **Candidate Key:** A minimal superkey from which no attribute can be removed without losing uniqueness.
* **Primary Key:** The candidate key selected by the database designer to uniquely identify entities.
* **Foreign Key:** An attribute in one relation that references the primary key of another relation to enforce referential integrity.
* **Partial Key (Discriminator):** An attribute in a weak entity set that uniquely identifies weak entities related to the same owner entity.

---

## Day 2: Structural Constraints, Advanced ER &amp; EER Modeling

### 1\. Structural Constraints

Structural constraints limit the possible combinations of entities in a relationship set.

```
                     STRUCTURAL CONSTRAINTS
                               │
         ┌─────────────────────┴─────────────────────┐
         ▼                                           ▼
   Cardinality Ratio                       Participation Constraint
 (1:1, 1:N, N:1, M:N)                        (Total vs. Partial)

```

1. **Cardinality Ratios (Binary Relationships):**
  * **1:1 (One-to-One):** An entity in A is associated with at most one entity in B, and vice versa (e.g., `DEPARTMENT` `MANAGES` `EMPLOYEE`).
  * **1:N (One-to-Many):** One entity in A is associated with many in B, but B is associated with at most one in A (e.g., `DEPARTMENT` `WORKS_FOR` `EMPLOYEE`).
  * **M:N (Many-to-Many):** Entities on both sides can be associated with multiple entities (e.g., `EMPLOYEE` `WORKS_ON` `PROJECT`).
2. **Participation Constraints (Existence Dependency):**
  * **Total Participation (Double Line):** Every entity in the entity set must participate in at least one relationship instance (e.g., every `EMPLOYEE` must work for a `DEPARTMENT`).
  * **Partial Participation (Single Line):** Some entities do not participate in the relationship (e.g., not every `EMPLOYEE` manages a `DEPARTMENT`).
3. **(min, max) Notation:** Replaces cardinality ratio and single/double lines by placing integer bounds `(min, max)` on participation arcs.

---

### 2\. Strong vs. Weak Entity Sets

* **Strong Entity Set:** Has a primary key of its own to identify entity occurrences uniquely[66][67]. Represented by a single rectangle.
* **Weak Entity Set:** Lacks a primary key of its own; relies on an **identifying owner entity type** and an **identifying relationship** combined with its **partial key**.
  * **Visual Notation:** Double rectangle for weak entity, double diamond for identifying relationship, and dashed underline for the partial key.

```
+─────────────────+         ║─────────────────║         ║─────────────────║
│    EMPLOYEE     │<───────>║  DEPENDENTS_OF  ║<───────>║    DEPENDENT    │
│  (Owner/Strong) │ (1:N)   ║  (Identifying)  ║ (Total) ║     (Weak)      │
+─────────────────+         ║─────────────────║         ║─────────────────║
│ SSN(Primary Key)|         │                 │         │ Name (Partial)  │
+─────────────────+         ║─────────────────║         ║─────────────────║

```

---

### 3\. Specialization, Generalization &amp; EER Constructs

* **Specialization (Top-Down):** Process of defining a set of subclasses of an entity type based on distinguishing characteristics (e.g., `EMPLOYEE` specialized into `SECRETARY`, `ENGINEER`, `TECHNICIAN`).
* **Generalization (Bottom-Up):** Reverse process of synthesizing shared characteristics of multiple entity types into a higher-level superclass (e.g., generalizing `CAR` and `TRUCK` into `VEHICLE`).
* **Attribute Inheritance:** Subclasses inherit all attributes and relationship participations of their superclasses.

#### Constraints on Specialization &amp; Generalization:

1. **Disjointness Constraint:**
  * **Disjoint ('d'):** An entity can belong to at most one subclass.
  * **Overlapping ('o'):** An entity can belong to multiple subclasses simultaneously.
2. **Completeness Constraint:**
  * **Total (Double Line):** Every superclass entity must belong to at least one subclass.
  * **Partial (Single Line):** A superclass entity can exist without belonging to any subclass.
3. **Defining Rules:**
  * **Predicate-defined:** Membership based on an attribute condition (e.g., `Job_Type = 'Secretary'`).
  * **User-defined:** Membership manually assigned by system users.

---

### 4\. Aggregation

* **Definition:** An abstraction mechanism that treats a relationship set (along with its participating entities) as a higher-level aggregate entity.
* **Why it is needed:** The basic ER model prohibits relationships between relationships[92][94]. Aggregation allows a relationship (e.g., `INTERVIEW` between `APPLICANT` and `COMPANY`) to participate in another relationship (e.g., `RESULTS_IN` `JOB_OFFER`).