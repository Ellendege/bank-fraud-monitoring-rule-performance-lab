SELECT
    t.channel,
    COUNT(*) AS total_reviewed_cases,
    SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN c.disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(c.confirmed_loss_amount) AS total_confirmed_loss,
    SUM(c.recovery_amount) AS total_recovery_amount,
    SUM(c.confirmed_loss_amount) - SUM(c.recovery_amount) AS net_loss
FROM cases c
JOIN alerts a
    ON c.alert_id = a.alert_id
JOIN transactions t
    ON a.transaction_id = t.transaction_id
GROUP BY t.channel
ORDER BY total_confirmed_loss DESC;

SELECT
    cu.customer_segment,
    COUNT(*) AS total_reviewed_cases,
    SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN c.disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(c.confirmed_loss_amount) AS total_confirmed_loss,
    SUM(c.recovery_amount) AS total_recovery_amount,
    SUM(c.confirmed_loss_amount) - SUM(c.recovery_amount) AS net_loss
FROM cases c
JOIN alerts a
    ON c.alert_id = a.alert_id
JOIN transactions t
    ON a.transaction_id = t.transaction_id
JOIN customers cu
    ON t.customer_id = cu.customer_id
GROUP BY cu.customer_segment
ORDER BY total_confirmed_loss DESC;

SELECT
    cu.region,
    COUNT(*) AS total_reviewed_cases,
    SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN c.disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(c.confirmed_loss_amount) AS total_confirmed_loss,
    SUM(c.recovery_amount) AS total_recovery_amount,
    SUM(c.confirmed_loss_amount) - SUM(c.recovery_amount) AS net_loss
FROM cases c
JOIN alerts a
    ON c.alert_id = a.alert_id
JOIN transactions t
    ON a.transaction_id = t.transaction_id
JOIN customers cu
    ON t.customer_id = cu.customer_id
GROUP BY cu.region
ORDER BY total_confirmed_loss DESC;