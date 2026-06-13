CREATE DATABASE telco_project;
USE telco_project;
CREATE TABLE telco_churn
(
    customerID VARCHAR(50),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(50),
    Churn VARCHAR(10)
);
SELECT * FROM telco_project.telco_churn;
SELECT *
FROM telco_churn
LIMIT 10;
SELECT COUNT(*) AS total_customers
FROM telco_churn;
SELECT COUNT(*) AS churn_customers
FROM telco_churn
WHERE Churn = 'Yes';
SELECT
ROUND(
COUNT(CASE WHEN Churn='Yes' THEN 1 END)
*100.0/COUNT(*),
2
) AS churn_rate
FROM telco_churn;
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_churn
GROUP BY Contract;
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM telco_churn
GROUP BY Churn;
SELECT
    Churn,
    ROUND(AVG(tenure),2) AS avg_tenure
FROM telco_churn
GROUP BY Churn;
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_churn
GROUP BY InternetService;