use classicmodels;

-- Consultar las tablas por separado
SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM productlines;
SELECT * FROM products;

-- Crear los JOINS necesarios para obtener las órdenes completas por cliente
SELECT 
    customers.customerNumber,
    customers.customerName,
    orders.orderNumber,
    orders.orderDate,
    orders.status,
    orderdetails.productCode,
    products.productName,
    orderdetails.quantityOrdered,
    orderdetails.priceEach,
    (orderdetails.quantityOrdered * orderdetails.priceEach) AS totalLinePrice
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode;


CREATE VIEW ordenes_por_cliente AS
SELECT 
    customers.customerNumber,
    customers.customerName,
    orders.orderNumber,
    orders.orderDate,
    orders.status,
    orderdetails.productCode,
    products.productName,
    orderdetails.quantityOrdered,
    orderdetails.priceEach,
    (orderdetails.quantityOrdered * orderdetails.priceEach) AS totalLinePrice
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode;