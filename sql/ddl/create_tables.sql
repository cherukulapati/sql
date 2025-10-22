CREATE SCHEMA IF NOT EXISTS sales;

CREATE TABLE IF NOT EXISTS sales.daily_orders (
    order_id     INT IDENTITY(1,1),
    order_date   DATE,
    region       VARCHAR(50),
    total_amount DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS sales.daily_orders_summary (
    order_date DATE,
    region VARCHAR(50),
    total_sales DECIMAL(10,2)
);
