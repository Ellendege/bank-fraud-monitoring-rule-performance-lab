SELECT 'transactions' AS table_name, COUNT(*) AS row_count
FROM transactions

UNION ALL

SELECT 'alerts' AS table_name, COUNT(*) AS row_count
FROM alerts

UNION ALL

SELECT 'rules' AS table_name, COUNT(*) AS row_count
FROM rules

UNION ALL

SELECT 'cases' AS table_name, COUNT(*) AS row_count
FROM cases

UNION ALL

SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers;