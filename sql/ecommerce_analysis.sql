SELECT
COUNT(*) AS total_users
FROM `bigquery-public-data.thelook_ecommerce.users`;


SELECT
COUNT(*) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.orders`;

SELECT
MIN(DATE(created_at)) AS start_date,
MAX(DATE(created_at)) AS end_date
FROM `bigquery-public-data.thelook_ecommerce.orders`;

SELECT
  COUNTIF(first_name IS NULL) AS missing_first_name,
  COUNTIF(age IS NULL) AS missing_age,
  COUNTIF(gender IS NULL) AS missing_gender
FROM `bigquery-public-data.thelook_ecommerce.users`;

SELECT
  order_id,
  COUNT(*) AS duplicate_count
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT
    p.category,
    ROUND(SUM(oi.sale_price),2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
ON oi.product_id = p.id
GROUP BY p.category
ORDER BY total_revenue DESC;





SELECT
    p.category,
    ROUND(SUM(oi.sale_price),2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
ON oi.product_id = p.id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
  EXTRACT(MONTH FROM created_at) AS month,
  ROUND(SUM(sale_price),2) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY month
ORDER BY month;



SELECT
    u.gender,
    ROUND(SUM(oi.sale_price),2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.users` u
ON oi.user_id = u.id
GROUP BY u.gender
ORDER BY total_revenue DESC;


SELECT
  CASE
    WHEN age < 25 THEN 'Under 25'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
  END AS age_group,
  ROUND(SUM(oi.sale_price),2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.users` u
ON oi.user_id = u.id
GROUP BY age_group
ORDER BY total_revenue DESC;


SELECT
  country,
  ROUND(SUM(oi.sale_price),2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.users` u
ON oi.user_id = u.id
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;


SELECT
    p.name AS product_name,
    COUNT(DISTINCT ii.id) AS inventory_count,
    COUNT(DISTINCT oi.order_id) AS sales_count
FROM `bigquery-public-data.thelook_ecommerce.products` p
LEFT JOIN `bigquery-public-data.thelook_ecommerce.inventory_items` ii
    ON p.id = ii.product_id
LEFT JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
    ON p.id = oi.product_id
GROUP BY product_name
HAVING inventory_count > 50
ORDER BY inventory_count DESC, sales_count ASC
LIMIT 20;


WITH cohorts AS (
  SELECT
    user_id,
    DATE_TRUNC(DATE(MIN(created_at)), MONTH) AS cohort_month
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  GROUP BY user_id
),

activity AS (
  SELECT
    user_id,
    DATE_TRUNC(DATE(created_at), MONTH) AS activity_month
  FROM `bigquery-public-data.thelook_ecommerce.orders`
),

retention AS (
  SELECT
    c.cohort_month,
    DATE_DIFF(
      a.activity_month,
      c.cohort_month,
      MONTH
    ) AS month_number,
    COUNT(DISTINCT a.user_id) AS retained_users
  FROM cohorts c
  JOIN activity a
    ON c.user_id = a.user_id
  GROUP BY 1,2
)

SELECT *
FROM retention
ORDER BY cohort_month, month_number;

SELECT
event_type,
COUNT(*) AS total_events
FROM `bigquery-public-data.thelook_ecommerce.events`
GROUP BY event_type
ORDER BY total_events DESC;

WITH funnel AS (
SELECT
COUNT(DISTINCT CASE WHEN event_type='home' THEN user_id END) AS visitors,
COUNT(DISTINCT CASE WHEN event_type='product' THEN user_id END) AS product_viewers,
COUNT(DISTINCT CASE WHEN event_type='cart' THEN user_id END) AS cart_users,
COUNT(DISTINCT CASE WHEN event_type='purchase' THEN user_id END) AS buyers
FROM `bigquery-public-data.thelook_ecommerce.events`
)

SELECT 'Visitors' AS stage, visitors AS users FROM funnel
UNION ALL
SELECT 'Product View', product_viewers FROM funnel
UNION ALL
SELECT 'Add To Cart', cart_users FROM funnel
UNION ALL
SELECT 'Purchase', buyers FROM funnel;


SELECT
event_type,
COUNT(DISTINCT user_id) AS unique_users
FROM `bigquery-public-data.thelook_ecommerce.events`
GROUP BY event_type
ORDER BY unique_users DESC;

SELECT
COUNT(DISTINCT CASE WHEN event_type='home' THEN user_id END) AS home_users,
COUNT(DISTINCT CASE WHEN event_type='product' THEN user_id END) AS product_users,
COUNT(DISTINCT CASE WHEN event_type='cart' THEN user_id END) AS cart_users,
COUNT(DISTINCT CASE WHEN event_type='purchase' THEN user_id END) AS purchase_users
FROM `bigquery-public-data.thelook_ecommerce.events`;


SELECT
  dc.name AS distribution_center,
  COUNT(DISTINCT oi.order_id) AS total_orders,
  ROUND(SUM(oi.sale_price),2) AS total_revenue,
  ROUND(
    SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id),
    2
  ) AS revenue_per_order
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
JOIN `bigquery-public-data.thelook_ecommerce.distribution_centers` dc
  ON p.distribution_center_id = dc.id
GROUP BY dc.name
ORDER BY revenue_per_order DESC;
