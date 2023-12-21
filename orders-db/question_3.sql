SELECT
    s.store_type,
    SUM(p.sale_price * o.product_quantity) 
FROM
    orders o
    INNER JOIN dim_date d ON d.date = o.order_date
    INNER JOIN dim_product p ON p.product_code = o.product_code
    INNER JOIN dim_store s ON s.store_code = o.store_code
WHERE
    d.year = 2022
    AND s.country_code = 'DE'
GROUP BY
    s.store_type
ORDER BY
    SUM(p.sale_price * o.product_quantity) DESC
LIMIT 1;