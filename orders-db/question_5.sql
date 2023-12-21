SELECT
    p.category AS "Category",
    SUM((p.sale_price - p.cost_price) * o.product_quantity) AS "Profit"
FROM
    orders o
    INNER JOIN dim_date d ON d.date = o.order_date
    INNER JOIN dim_product p ON p.product_code = o.product_code
    INNER JOIN dim_store s ON s.store_code = o.store_code
WHERE 
    s.full_region =  'Wiltshire, UK'
    AND d.year = 2021
GROUP BY
    p.category
ORDER BY 
    SUM((p.sale_price - p.cost_price) * o.product_quantity) DESC
LIMIT 1;