-- =========================================================================================================================================================================
-- 1. Bank Marketing (Exploratory Data Analysis (EDA))
-- =========================================================================================================================================================================

-- 1.1 Age Category Distribution
SELECT age_category, COUNT(*) AS total_customers
FROM bank_cleaned
GROUP BY age_category
ORDER BY total_customers DESC;

-- 1.2 Subscription Rate
SELECT 
    deposit_variable,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM bank_cleaned) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY deposit_variable;

-- 1.3 subscription_rate by Education
SELECT 
    education, COUNT(*) AS total_customers,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY education
ORDER BY subscription_rate DESC;

-- 1.4 subscription_rate by Job
SELECT 
    job, COUNT(*) AS total_customers,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY job
ORDER BY subscription_rate desc;

-- 1.5 Marital Status
SELECT 
    marital, COUNT(*) AS total_customers,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY marital
ORDER BY subscription_rate desc;

-- 1.6 Combine multiple factors (age_category vs job)
SELECT 
    age_category,
    job,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY age_category, job
ORDER BY subscription_rate DESC
LIMIT 10;


-- 1.7 age_category and campaign effect
SELECT 
    age_category, campaign,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY age_category, campaign
ORDER BY subscription_rate DESC;

-- =========================================================================================================================================================================
-- 2. Campaign Effectiveness Analysis
-- =========================================================================================================================================================================

-- 2.1 Contact Method
SELECT 
    contact,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY contact
ORDER BY subscription_rate DESC;

-- 2.2 Best Performing Months
SELECT 
    month,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY month
ORDER BY subscription_rate DESC;

-- 2.3 Impact of Call Duration
SELECT 
    CASE 
        WHEN duration < 100 THEN '<100s'
        WHEN duration BETWEEN 100 AND 300 THEN '100-300s'
        ELSE '>300s'
    END AS duration_group,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY duration_group
ORDER BY subscription_rate DESC;

-- 2.4 Number of Campaign Contacts
SELECT 
    campaign,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY campaign
ORDER BY subscription_rate DESC;

-- 2.5  Previous campaign outcome
SELECT 
    poutcome,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY poutcome
ORDER BY subscription_rate DESC;

-- =========================================================================================================================================================================
-- 3. Customer Financial Behaviour
-- =========================================================================================================================================================================

-- 3.1 Deposit Outcome by Balance
SELECT 
    deposit_variable,
    ROUND(AVG(balance),2) AS avg_balance
FROM bank_cleaned
GROUP BY deposit_variable;

-- 3.2 Balance Segmentation
SELECT 
    CASE 
        WHEN balance < 0 THEN 'Negative'
        WHEN balance BETWEEN 0 AND 1000 THEN '0-1000'
        WHEN balance BETWEEN 1001 AND 5000 THEN '1001-5000'
        ELSE '>5000'
    END AS balance_group,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY balance_group
ORDER BY subscription_rate DESC;

-- Customers with personal loan and housing loan
SELECT 
    loan, housing,
    ROUND(SUM(deposit_variable = 'yes') / COUNT(*) * 100, 2) AS subscription_rate
FROM bank_cleaned
GROUP BY loan, housing
ORDER BY subscription_rate DESC
LIMIT 10;

