SELECT 
    COUNT(*) AS total_alerts,
    COUNT(t.transaction_id) AS matched_transactions,
    COUNT(*) - COUNT(t.transaction_id) AS unmatched_transactions
FROM alerts a
LEFT JOIN transactions t
    ON a.transaction_id = t.transaction_id;

SELECT 
    COUNT(*) AS total_cases,
    COUNT(a.alert_id) AS matched_alerts,
    COUNT(*) - COUNT(a.alert_id) AS unmatched_alerts
FROM cases c
LEFT JOIN alerts a
    ON c.alert_id = a.alert_id;

SELECT 
    COUNT(*) AS total_alerts,
    COUNT(r.rule_id) AS matched_rules,
    COUNT(*) - COUNT(r.rule_id) AS unmatched_rules
FROM alerts a
LEFT JOIN rules r
    ON a.rule_id = r.rule_id;

SELECT 
    COUNT(*) AS total_transactions,
    COUNT(c.customer_id) AS matched_customers,
    COUNT(*) - COUNT(c.customer_id) AS unmatched_customers
FROM transactions t
LEFT JOIN customers c
    ON t.customer_id = c.customer_id;