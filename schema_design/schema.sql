-- Customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    country VARCHAR(50),
    city VARCHAR(50)
);

-- Products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    stock_quantity INT,
    reorder_level INT,
    product_description TEXT
);

-- Orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10, 2),
    status VARCHAR(20)
);

-- Order Details table
CREATE TABLE order_details (
    details_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price NUMERIC(10, 2),
    total_amount NUMERIC(10, 2)
);


-- Inventory table
CREATE TABLE inventory (
    log_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    change_quantity INT,
    change_type VARCHAR(50), -- e.g., 'restock', 'sale', etc.
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
