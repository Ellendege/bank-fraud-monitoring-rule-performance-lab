SELECT
    case_open_date,
    COUNT(*) AS total_cases_reviewed,
    SUM(CASE WHEN confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(confirmed_loss_amount) AS total_confirmed_loss
FROM cases
GROUP BY case_open_date
ORDER BY case_open_date;

SELECT
    t.transaction_date,
    COUNT(*) AS total_alerted_transactions,
    SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN c.disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(c.confirmed_loss_amount) AS total_confirmed_loss
FROM cases c
JOIN alerts a
    ON c.alert_id = a.alert_id
JOIN transactions t
    ON a.transaction_id = t.transaction_id
GROUP BY t.transaction_date
ORDER BY t.transaction_date;

SELECT
    t.transaction_date,
    t.channel,
    COUNT(*) AS total_reviewed_cases,
    SUM(CASE WHEN c.confirmed_fraud_flag = 'Yes' THEN 1 ELSE 0 END) AS confirmed_fraud_cases,
    SUM(CASE WHEN c.disposition = 'False Positive' THEN 1 ELSE 0 END) AS false_positive_cases,
    SUM(c.confirmed_loss_amount) AS total_confirmed_loss
FROM cases c
JOIN alerts a
    ON c.alert_id = a.alert_id
JOIN transactions t
    ON a.transaction_id = t.transaction_id
GROUP BY t.transaction_date, t.channel
ORDER BY t.transaction_date, t.channel;

