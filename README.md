# Explanation of Queries

# Query 1: Selects all unique customers who placed orders within the last 30 days

#### This query retrieves customer information for orders placed within the last 30 days, using CURDATE() to get the current date and INTERVAL 30 DAY to calculate the date 30 days ago.

# Query 2: Calculates the total order amount spent by each customer.

#### This query joins the Customers and Orders tables, grouping by customer and calculating the sum of the total_amount for each customer.

# Query 3: Updates the price of "Product C" to 45.00.

#### This updates the price of a specific product identified by product_name.

# Query 4: Adds a new column discount to the products table with a default value of 0.

#### Adds a discount column with a default value of 0.00 to the Products table.

# Query 5: Retrieves the top 3 products by price in descending order.

#### This query orders products by price in descending order and limits the result to the top 3.

# Query 6: Lists the names of customers who have ordered "Product A".

#### This query joins Customers, Orders, Order_Items, and Products tables to find customers who ordered a specific product, here "Product A."

# Query 7: Joins customers and orders to get each customer's name and their order dates.

#### Retrieves each customer’s name and the date of each order.

# Query 8: Retrieves orders with a total_amount greater than 150.00.

#### Filters the Orders table to show orders where total_amount exceeds 150.00.

# Query 9: Normalizes the database by creating order_items to handle products in orders, establishing relationships to orders and products.

#### We will create an Order_Items table to store individual items within an order, making it easier to manage multiple products in a single order.
#### The Order_Items table includes:

#### order_item_id - unique ID for each order item
#### order_id - reference to the Orders table
#### product_id - reference to the Products table
#### quantity - quantity of each product in the order
#### price - price of the product at the time of the order
#### After creating the Order_Items table, we update Orders to reference the total amount as the sum of all Order_Items for that order.



# Query 10: Retrieves the average order total across all orders.
#### This calculates the average of all orders' total amounts by first calculating each order’s total using the Order_Items table and then averaging these totals.
