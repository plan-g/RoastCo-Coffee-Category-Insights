-- Clean nulls and ensure correct types
SELECT *
FROM roastco_data
WHERE brand IS NOT NULL AND price IS NOT NULL AND units_sold IS NOT NULL;

-- Promo type distribution
SELECT promo_type, COUNT(*) AS count
FROM roastco_data
GROUP BY promo_type;

-- Monthly revenue by brand
SELECT DATE_TRUNC('month', date) AS month, brand, SUM(revenue) AS total_revenue
FROM roastco_data
GROUP BY month, brand
ORDER BY month;

-- Average units sold by region and pack size
SELECT region, pack_size, AVG(units_sold) AS avg_units
FROM roastco_data
GROUP BY region, pack_size;

-- Feature for regression modelling
SELECT *,
       price * units_sold AS estimated_impact,
       CASE WHEN promo_type <> 'None' THEN 1 ELSE 0 END AS is_promoted
FROM roastco_data;
