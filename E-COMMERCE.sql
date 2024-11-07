CREATE DATABASE E_commerce;
USE E_commerce;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);


CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    description TEXT
);


INSERT INTO customers (name, email, address)
VALUES 
    ('John Doe', 'john.doe@example.com', '123 Elm St, Springfield'),
    ('Jane Smith', 'jane.smith@example.com', '456 Oak St, Springfield'),
    ('Alice Johnson', 'alice.j@example.com', '789 Pine St, Springfield'),
    ('Bob Brown', 'bob.brown@example.com', '101 Maple St, Springfield');
    
    SELECT * FROM CUSTOMERS;


INSERT INTO orders (customer_id, order_date, total_amount)
VALUES 
    (1, CURDATE() - INTERVAL 5 DAY, 150.00),
    (2, CURDATE() - INTERVAL 20 DAY, 250.00),
    (3, CURDATE() - INTERVAL 15 DAY, 300.00),
    (4, CURDATE() - INTERVAL 35 DAY, 120.00),
    (1, CURDATE() - INTERVAL 2 DAY, 400.00);


SELECT * FROM ORDERS;

INSERT INTO products (name, price, description)
VALUES 
    ('Product A', 30.00, 'Description of Product A'),
    ('Product B', 20.00, 'Description of Product B'),
    ('Product C', 50.00, 'Description of Product C'),
    ('Product D', 80.00, 'Description of Product D'),
    ('Product E', 60.00, 'Description of Product E');

SELECT * FROM PRODUCTS;



SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date >= NOW() - INTERVAL 30 DAY;


SELECT c.id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;


SELECT * FROM products WHERE name = 'Product C';

UPDATE products
SET price = 45.00
WHERE name = 'Product C';


ALTER TABLE products
ADD COLUMN discount DECIMAL(5, 2) DEFAULT 0.00;


SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 3;


SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.name = 'Product A';



SELECT c.name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id;


SELECT id, customer_id, order_date, total_amount
FROM orders
WHERE total_amount > 150.00;

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


SELECT AVG(total_amount) AS average_order_total
FROM orders;
