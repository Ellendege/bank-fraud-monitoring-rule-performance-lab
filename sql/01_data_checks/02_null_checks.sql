SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS null_transaction_id,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN transaction_date IS NULL THEN 1 ELSE 0 END) AS null_transaction_date,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS null_amount
FROM transactions;

SELECT 
    COUNT(*) AS total_alerts,
    SUM(CASE WHEN alert_id IS NULL THEN 1 ELSE 0 END) AS null_alert_id,
    SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS null_transaction_id,
    SUM(CASE WHEN rule_id IS NULL THEN 1 ELSE 0 END) AS null_rule_id,
    SUM(CASE WHEN alert_date IS NULL THEN 1 ELSE 0 END) AS null_alert_date
FROM alerts;

SELECT 
    COUNT(*) AS total_cases,
    SUM(CASE WHEN case_id IS NULL THEN 1 ELSE 0 END) AS null_case_id,
    SUM(CASE WHEN alert_id IS NULL THEN 1 ELSE 0 END) AS null_alert_id,
    SUM(CASE WHEN case_open_date IS NULL THEN 1 ELSE 0 END) AS null_case_open_date,
    SUM(CASE WHEN disposition IS NULL THEN 1 ELSE 0 END) AS null_disposition
FROM cases;

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN customer_segment IS NULL THEN 1 ELSE 0 END) AS null_customer_segment,
    SUM(CASE WHEN risk_rating IS NULL THEN 1 ELSE 0 END) AS null_risk_rating
FROM customers;