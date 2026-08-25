-- AI Customer Support Requirement & Analytics Dashboard
-- PostgreSQL / SQL Server compatible with minor date-function adjustments

CREATE TABLE customer_complaints (
    complaint_id VARCHAR(20) PRIMARY KEY,
    complaint_date DATE,
    channel VARCHAR(30),
    region VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    issue VARCHAR(120),
    priority VARCHAR(20),
    resolution_time_hours DECIMAL(10,2),
    csat_score INT,
    sentiment VARCHAR(20),
    status VARCHAR(20)
);

SELECT COUNT(*) AS total_complaints FROM customer_complaints;

SELECT category, COUNT(*) AS complaint_count
FROM customer_complaints
GROUP BY category ORDER BY complaint_count DESC LIMIT 1;

SELECT ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_hours
FROM customer_complaints;

SELECT ROUND(AVG(csat_score), 2) AS avg_csat
FROM customer_complaints;

SELECT priority, COUNT(*) AS complaint_count,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct
FROM customer_complaints
GROUP BY priority ORDER BY complaint_count DESC;

SELECT category, COUNT(*) AS complaints,
       ROUND(AVG(resolution_time_hours),2) AS avg_resolution_hours,
       ROUND(AVG(csat_score),2) AS avg_csat
FROM customer_complaints
GROUP BY category ORDER BY complaints DESC;

SELECT category, COUNT(*) AS high_priority_count
FROM customer_complaints
WHERE priority = 'High' AND status <> 'Resolved'
GROUP BY category ORDER BY high_priority_count DESC;

SELECT ROUND(100.0 * AVG(CASE WHEN resolution_time_hours <= 24 THEN 1.0 ELSE 0.0 END),2)
       AS sla_24h_pct
FROM customer_complaints;

SELECT channel, COUNT(*) AS complaints,
       ROUND(AVG(resolution_time_hours),2) AS avg_resolution_hours,
       ROUND(AVG(csat_score),2) AS avg_csat
FROM customer_complaints
GROUP BY channel ORDER BY complaints DESC;

SELECT issue, COUNT(*) AS complaints,
       ROUND(AVG(resolution_time_hours),2) AS avg_resolution_hours,
       ROUND(AVG(csat_score),2) AS avg_csat
FROM customer_complaints
GROUP BY issue
HAVING AVG(csat_score) <= 2.5
ORDER BY complaints DESC;
