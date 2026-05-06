SELECT
    COUNT(*) AS total_cases_reviewed,
    SUM(CASE WHEN confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN confirmed_fraud_flag = 'No' THEN 1 ELSE 0 END) AS non_fraud_cases,
    SUM(CASE WHEN disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(confirmed_loss_amount) AS total_confirmed_loss,
    SUM(recovery_amount) AS total_recovery_amount,
    SUM(confirmed_loss_amount) - SUM(recovery_amount) AS net_loss
FROM cases;

SELECT
    disposition,
    COUNT(*) AS case_count,
    SUM(confirmed_loss_amount) AS total_loss_amount,
    SUM(recovery_amount) AS total_recovery_amount
FROM cases
GROUP BY disposition
ORDER BY case_count DESC;

SELECT
    COUNT(*) AS total_cases,
    SUM(CASE WHEN confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    ROUND(
        100.0 * SUM(CASE WHEN confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS confirmed_fraud_case_rate_pct,
    ROUND(
        100.0 * SUM(CASE WHEN confirmed_fraud_flag = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS non_fraud_case_rate_pct
FROM cases;