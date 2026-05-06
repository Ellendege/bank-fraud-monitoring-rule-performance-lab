SELECT
    r.rule_id,
    r.rule_name,
    r.rule_category,
    COUNT(*) AS alert_count
FROM alerts a
JOIN rules r
    ON a.rule_id = r.rule_id
GROUP BY r.rule_id, r.rule_name, r.rule_category
ORDER BY alert_count DESC;

SELECT
    r.rule_id,
    r.rule_name,
    COUNT(*) AS total_alerts,
    SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN c.disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(c.confirmed_loss_amount) AS total_confirmed_loss,
    SUM(c.recovery_amount) AS total_recovery_amount,
    SUM(c.confirmed_loss_amount) - SUM(c.recovery_amount) AS net_loss
FROM alerts a
JOIN rules r
    ON a.rule_id = r.rule_id
JOIN cases c
    ON a.alert_id = c.alert_id
GROUP BY r.rule_id, r.rule_name
ORDER BY total_confirmed_loss DESC;

SELECT
    r.rule_id,
    r.rule_name,
    COUNT(*) AS total_alerts,
    SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    ROUND(
        100.0 * SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS alert_to_fraud_conversion_rate_pct,
    ROUND(
        100.0 * SUM(CASE WHEN c.disposition = 'False Positive' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS false_positive_rate_pct
FROM alerts a
JOIN rules r
    ON a.rule_id = r.rule_id
JOIN cases 
    ON a.alert_id = c.alert_id
GROUP BY r.rule_id, r.rule_name
ORDER BY alert_to_fraud_conversion_rate_pct DESC;

