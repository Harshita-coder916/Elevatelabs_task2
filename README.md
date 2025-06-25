# Elevatelabs_task2
The task focuses on data manipulation operations (INSERT, UPDATE, DELETE), handling `NULL`s, partial inserts, transactions, and select-based inserts

# SQL Internship – Task 2: Data Insertion & NULL Handling

This repository contains the SQL scripts for **Task 2** of the SQL Developer Internship.  


---

## 📁 Files Included

| File              | Description                              |
|-------------------|------------------------------------------|
| `task2_dml.sql`   | SQL script for all Task 2 operations     |

---

## 🛠️ Technologies

- **Database:** MySQL (or compatible engines)
- **Tables:** `Customers`, `Products`, `Orders`, `Order_Items`, `Payments`

---

## ✅ Operations Performed

### 1. **Data Insertion**
- Added records with and without `NULL` values.
- Used partial column insert syntax.
- Maintained referential integrity using `order_id`, `customer_id`, etc.

### 2. **UPDATE**
- Updated `total_amount` in `Orders` using JOIN with `Order_Items`.
- Applied conditional price updates based on business rules.

### 3. **DELETE + ROLLBACK**
- Demonstrated a transactional delete that was rolled back safely.

### 4. **SELECT-based INSERT**
- Inserted discounted/low-priced products into a new `Clearance_Products` table using a `SELECT` statement.


