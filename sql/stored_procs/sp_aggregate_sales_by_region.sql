CREATE OR REPLACE PROCEDURE sales.aggregate_sales_by_region(p_date DATE, p_region VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO sales.daily_orders_summary
    SELECT p_date, p_region, SUM(total_amount) AS total_sales
    FROM sales.daily_orders
    WHERE order_date = p_date AND region = p_region
    GROUP BY p_date, p_region;
END;
$$;
