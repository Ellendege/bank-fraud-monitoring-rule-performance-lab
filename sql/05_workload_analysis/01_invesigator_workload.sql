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
JOIN cases c
    ON a.alert_id = c.alert_id
GROUP BY r.rule_id, r.rule_name
ORDER BY alert_to_fraud_conversion_rate_pct DESC; 

SELECT
    queue_name,
    COUNT(*) AS total_alerts_in_queue,
    SUM(CASE WHEN alert_priority = 'High' THEN 1 ELSE 0 END) AS high_priority_alerts,
    SUM(CASE WHEN alert_priority = 'Medium' THEN 1 ELSE 0 END) AS medium_priority_alerts,
    SUM(CASE WHEN alert_priority = 'Low' THEN 1 ELSE 0 END) AS low_priority_alerts
FROM alerts
GROUP BY queue_name
ORDER BY total_alerts_in_queue DESC;

SELECT
    investigator_name,
    COUNT(*) AS total_cases,
    AVG(case_close_date - case_open_date) AS avg_case_turnaround_days
FROM cases
GROUP BY investigator_name
ORDER BY avg_case_turnaround_days DESC;