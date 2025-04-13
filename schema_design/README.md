# 🗂️ Inventory Management Database

## 🔧 Tools Used

- **PostgreSQL** – Relational database used for storing and managing inventory data.
- **Docker** – Used to containerize and run PostgreSQL services locally.
- **pgAdmin (Desktop)** – GUI client for managing and querying the PostgreSQL database.
- **SQL** – For creating schema and performing database operations.

---

## 🧱 Database Schema Overview

This database is designed to manage a basic **inventory and order management system**. It includes information on customers, products, orders, inventory changes, and order details.

**Entity Relationships:**

- **Customers** place multiple **Orders**
- **Orders** contain multiple **Order Items**
- **Products** are referenced in both **Order Items** and **Inventory Logs**

---

## 🧮 Tables & Column Descriptions

### 1. `customers`

Stores customer information.

| Column         | Data Type     | Description                    |
|----------------|---------------|--------------------------------|
| customer_id    | SERIAL (PK)   | Unique identifier              |
| customer_name  | VARCHAR(100)  | Full name of the customer      |
| email          | VARCHAR(100)  | Email address                  |
| phone_number   | VARCHAR(20)   | Contact number                 |
| country        | VARCHAR(50)   | Country of residence           |
| city           | VARCHAR(50)   | City of residence              |

---

### 2. `products`

Stores product information.

| Column         | Data Type     | Description                          |
|----------------|---------------|--------------------------------------|
| product_id     | SERIAL (PK)   | Unique identifier                    |
| product_name   | VARCHAR(100)  | Name of the product                  |
| category       | VARCHAR(50)   | Category or type of product          |
| price          | NUMERIC(10,2) | Price per unit                       |
| stock_quantity | INT           | Quantity currently in stock          |
| reorder_level  | INT           | Threshold to trigger reordering      |
| description    | TEXT          | Additional product description       |

---

### 3. `orders`

Stores order data and links to customers.

| Column         | Data Type     | Description                          |
|----------------|---------------|--------------------------------------|
| order_id       | SERIAL (PK)   | Unique identifier                    |
| customer_id    | INT (FK)      | Reference to `customers.customer_id` |
| order_date     | DATE          | Date of the order                    |
| total_amount   | NUMERIC(10,2) | Total order value                    |
| status         | VARCHAR(20)   | Status (e.g. pending, completed)     |

---

### 4. `order_items`

Details the individual details in an order.

| Column         | Data Type     | Description                           |
|----------------|---------------|---------------------------------------|
| details_id     | SERIAL (PK)   | Unique identifier                     |
| order_id       | INT (FK)      | Reference to `orders.order_id`        |
| product_id     | INT (FK)      | Reference to `products.product_id`    |
| quantity       | INT           | Number of units ordered               |
| unit_price     | NUMERIC(10,2) | Price per unit at time of order       |
| total_amount   | NUMERIC(10,2) | Total cost = quantity × unit_price    |

---

### 5. `inventory`

Tracks stock changes such as restocks or sales.

| Column         | Data Type     | Description                              |
|----------------|---------------|------------------------------------------|
| log_id         | SERIAL (PK)   | Unique identifier                        |
| product_id     | INT (FK)      | Reference to `products.product_id`       |
| change_quantity| INT           | Number of items added or removed         |
| change_type    | VARCHAR(50)   | e.g. `restock`, `sale`, `return`         |
| changed_at     | TIMESTAMP     | When the inventory change occurred       |

---

## 🔗 Relationships

- **1 customer → M orders**
- **1 order → M order_items**
- **1 product → M order_items**
- **1 product → M inventory logs**

---

## 🖼️ ERD (Entity Relationship Diagram)

![ERD](ERD.png)

---

