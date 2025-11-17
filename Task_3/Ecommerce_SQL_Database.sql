-- Count the total number of transactions in the dataset.

SELECT count(distinct order_id) as total_transactions
FROM ecommerce.payments
;

-- Find the total number of unique customers.

SELECT COUNT(distinct customer_id) AS total_customers
FROM customers;

-- What are the total number of transactions in different types

SELECT payment_type, count(*) AS number_of_transaction
FROM PAYMENTS
GROUP BY payment_type
;

-- Number of products each seller sells

SELECT seller_id, COUNT(*) AS total_products_per_seller
FROM ORDERITEMS
GROUP BY seller_id
;
-------------------------------------------------------------
-- Total revenue generated from each product category

SELECT 
    product_category_name,
    ROUND(SUM(O.price + O.shipping_charges), 2) AS total_revenue
FROM
    orderitems AS O
        JOIN
    products AS P ON O.product_id = P.product_id
GROUP BY product_category_name
ORDER BY total_revenue DESC
;

-- Which sellers earned the most in total sales

SELECT 
    seller_id,
    ROUND(SUM(price + shipping_charges), 2) AS top_sellers
FROM
    orderitems
GROUP BY seller_id
ORDER BY top_sellers DESC
LIMIT 5
;
-----------------------------------------------------
-- Top 10 customers by total money spent

SELECT customer_id, ROUND(SUM(price + shipping_charges),2) AS top_spents
FROM orders AS O
JOIN orderitems AS OI
ON O.order_id = OI.order_id
GROUP BY customer_id
ORDER BY top_spents DESC
;

-- Find all customers who have made at least one order with total value above 500.

SELECT DISTINCT
    O.customer_id
FROM
    ORDERS AS O
        JOIN
    (SELECT 
        order_id, SUM(price + shipping_charges) AS order_total
    FROM
        orderitems
    GROUP BY order_id) AS OI ON o.order_id = OI.order_id
WHERE
    OI.order_total > 500;



