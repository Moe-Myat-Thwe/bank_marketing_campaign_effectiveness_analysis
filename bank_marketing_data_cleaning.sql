-- Bank Marketing Analysis using SQL

	-- ===================================================================================================================================================================
    -- 1. first thing I did is create a copy table. This is the one I will work in and clean the data. I want a table with the raw data in case something happens
	-- ===================================================================================================================================================================
	DROP TABLE IF EXISTS bank_marketing_copy;
	CREATE TABLE bank_marketing_copy
	LIKE bank_marketing;

	INSERT bank_marketing_copy
	SELECT * FROM bank_marketing;

	-- ===================================================================================================================================================================
	-- 2. Check for Missing, Invalid, or Inconsistent Values
	-- ===================================================================================================================================================================

	-- Count total rows
	SELECT COUNT(*) FROM bank_marketing_copy;

	-- Check Unique / Distinct Values
	SELECT DISTINCT job AS unique_jobs FROM bank_marketing_copy ORDER BY job;
	SELECT DISTINCT marital AS unique_marital_statuses FROM bank_marketing_copy ORDER BY marital;
	SELECT DISTINCT education AS unique_education_levels FROM bank_marketing_copy ORDER BY education;
	SELECT DISTINCT loan AS unique_loan FROM bank_marketing_copy ORDER BY loan;
	SELECT DISTINCT contact AS unique_contact_types FROM bank_marketing_copy ORDER BY contact;
-- There are some unknown and I will leave them as a category
    
-- Check Numeric Ranges
	SELECT 
	  MIN(age) AS min_age, MAX(age) AS max_age,
	  MIN(salary) AS min_salary, MAX(salary) AS max_salary,
	  MIN(balance) AS min_balance, MAX(balance) AS max_balance,
	  MIN(duration) AS min_duration, MAX(duration) AS max_duration
	FROM bank_marketing_copy;


	-- Check for null or blank values

	SELECT

	  -- Numeric columns
	  SUM(age IS NULL) AS null_age,
	  SUM(balance IS NULL) AS null_balance,
	  SUM(duration IS NULL) AS null_duration,
	  SUM(previous IS NULL) AS null_previous,

	  -- Text columns (handle blanks)
	  SUM(job IS NULL OR job = '') AS invalid_job,
	  SUM(marital IS NULL OR marital = '') AS invalid_marital,
	  SUM(education IS NULL OR education = '') AS invalid_education,
	  SUM(housing IS NULL OR housing = '') AS invalid_housing,
	  SUM(loan IS NULL OR loan = '') AS invalid_loan,
	  SUM(contact IS NULL OR contact = '') AS invalid_contact,
	  SUM(y IS NULL OR y = '') AS invalid_y

	FROM bank_marketing_copy;

	-- ===================================================================================================================================================================
	-- 3. Create a Cleaned Version
	-- ===================================================================================================================================================================

	-- Now standardize cases, and remove obvious noise.
	DROP TABLE IF EXISTS bank_cleaned;
    
	CREATE TABLE bank_cleaned AS
	SELECT
	  age,
	  CASE
		WHEN age < 25 THEN 'Young'
		WHEN age BETWEEN 25 AND 45 THEN 'Adult'
		WHEN age BETWEEN 46 AND 60 THEN 'Mid-age'
		ELSE 'Senior'
	  END AS age_category,  --  Instead of age group number , using age category is more readable      
	  CONCAT(UPPER(SUBSTRING(TRIM(job), 1, 1)), LOWER(SUBSTRING(TRIM(job), 2))) AS job,
	  salary,	
      CONCAT(UPPER(SUBSTRING(TRIM(marital), 1, 1)), LOWER(SUBSTRING(TRIM(marital), 2))) AS marital,
      CONCAT(UPPER(SUBSTRING(TRIM(education), 1, 1)), LOWER(SUBSTRING(TRIM(education), 2))) AS education,
	  CONCAT(UPPER(SUBSTRING(TRIM(`marital-education`), 1, 1)), LOWER(SUBSTRING(TRIM(`marital-education`), 2))) AS marital_education,
	  CASE WHEN LOWER(TRIM(targeted)) IN ('yes','no') THEN LOWER(TRIM(targeted)) ELSE NULL END AS targeted,
	  CASE WHEN LOWER(TRIM(`default`)) IN ('yes','no') THEN LOWER(TRIM(`default`)) ELSE NULL END AS `default`,	  
	  balance,
	  CASE WHEN LOWER(TRIM(housing)) IN ('yes','no') THEN LOWER(TRIM(housing)) ELSE NULL END AS housing,
	  CASE WHEN LOWER(TRIM(loan)) IN ('yes','no') THEN LOWER(TRIM(loan)) ELSE NULL END AS loan,	  
	  LOWER(TRIM(contact)) AS contact,
	  day,	
      CONCAT(UPPER(SUBSTRING(TRIM(month), 1, 1)), LOWER(SUBSTRING(TRIM(month), 2))) AS month,
	  duration,    
	  campaign,
	  pdays,
	  previous,
	  LOWER(TRIM(poutcome)) AS poutcome,
	  CASE WHEN LOWER(TRIM(y)) IN ('yes','no') THEN LOWER(TRIM(y)) ELSE NULL END AS deposit_variable      
	 FROM bank_marketing_copy;
    
  -- ===================================================================================================================================================================
  -- 4. Validation Checks
  -- ===================================================================================================================================================================
-- --------------------------------------------------------------------------------------------------------------------------------
	-- Verify no duplicates
	WITH duplicates as (SELECT 
		age, age_category, job, salary, marital, education, marital_education,
		targeted, `default`, balance, housing, loan, contact, `day`, `month`, duration, 
		campaign, pdays, previous, poutcome, deposit_variable, 
		ROW_NUMBER() OVER (
			PARTITION BY 
			   age, age_category, job, salary, marital, education, marital_education,
		targeted, `default`, balance, housing, loan, contact, `day`, `month`, duration, 
		campaign, pdays, previous, poutcome, deposit_variable
		) AS row_num
	FROM 
		bank_cleaned)

	select * from duplicates where row_num >1;
	-- these are no duplicated rows.

	UPDATE bank_cleaned
	SET job = 'Admin'
	WHERE job = 'Admin.';


ALTER TABLE bank_cleaned
ADD COLUMN salary_group VARCHAR(20);

UPDATE bank_cleaned
SET salary_group = CASE
  WHEN salary < 50000 THEN 'Low'
  WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
  ELSE 'High'
END;






