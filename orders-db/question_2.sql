SELECT
    d.month_name, 
    SUM(p.sale_price * o.product_quantity) 
FROM
    orders o
    INNER JOIN dim_date d ON d.date = o.order_date
    INNER JOIN dim_product p ON p.product_code = o.product_code
WHERE
    d.year = 2022
GROUP BY
    d.month_name
ORDER BY
    SUM(p.sale_price * o.product_quantity) DESC
LIMIT 1;