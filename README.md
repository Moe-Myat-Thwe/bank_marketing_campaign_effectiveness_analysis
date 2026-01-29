# 📊 Bank Marketing Campaign Effectiveness Analysis

## 📌 Overview

This project analyzes a bank’s marketing campaign data to understand the key factors influencing customer subscription to term deposits. The objective is to transform raw campaign data into actionable insights that support better customer targeting, campaign optimization, and data-driven decision making.

The project follows an end-to-end analytics workflow, including data cleaning, feature engineering and analysis using SQL (MySQL), data modeling and visualization in Power BI, and business reporting and presentation.

<img width="1382" height="738" alt="image" src="https://github.com/user-attachments/assets/529678fa-e5f4-4b42-9752-5b5b6413698b" />


## 🗂️ Dataset (From Kaggle)

The dataset contains marketing campaign records with customer demographic, financial, and interaction information.

Key fields include:

- Customer demographics: age, job, education, marital status

- Financial indicators: balance, housing loan, personal loan, default

- Campaign details: contact method, call duration, number of contacts, campaign month

- Previous campaign outcome and recency

- Target variable: term deposit subscription (yes/no)

## 🛠️ Tools & Technologies

- MySQL – Data cleaning, transformation, feature engineering and analysis

- Power BI – Data modeling, DAX measures, and interactive dashboard

- Microsoft Word - Project Report Documentation

- QuillBot AI Presentation Maker (Pi) – Presentation (PPT) creation

- GitHub – Version control and documentation

## 🔄 Project Workflow
### 1. Data Cleaning & Feature Engineering (MySQL)

- Checked missing, duplicates and inconsistent values

- Standardized categorical fields 

- Created derived features such as age categories and salary groups

- Prepared analysis-ready data and export for BI consumption
  
### 2. Data Analysis (sql)

   •	Bank Marketing (Exploratory Data Analysis (EDA)) 
   
   - Age Category Distribution
   
   - Subscription Rate
   
   - subscription rate by (education, job, marital status, age category and job, age category and campaign effect)
    
 •	Campaign Effectiveness Analysis Contact Method
 
  - Best performing months
 
  - impact of call duration
 
  - Number of campaign contacts
 
  - Previous campaign outcome
   
 •	Customer Financial Behaviour 
 
  - Customers with personal loan and housing loan
    
  - Balance segmentation 

  - Deposit outcome by balance

### 3. Data Modeling & DAX (Power BI)

- Created key DAX measures including:

  - Total Customers
 
  - Subscsribed Customers
 
  - Overall Subscription Rate

  - Conversion Rate for Previously Contacted Customers


### 4. Dashboard Development (Power BI)

- Designed an executive-style dashboard with:

  - High-level KPIs

  - Campaign performance analysis

  - Customer segmentation insights

  - Financial behavior patterns

- Added slicers for interactive exploration by customer and campaign attributes

### 5. Reporting & Presentation

- Created a structured analytical report summarizing insights and recommendations

- Developed a presentation using Pi 

## 📈 Dashboard Highlights

- Clear KPI overview of campaign performance

- Impact of call duration and campaign frequency on conversion

- Customer segmentation by age, job, education, and salary group

- Analysis of previous campaign outcomes

- Insights into loan, default, and balance behavior

## 💡 Key Results & Insights

- Customers with previous successful campaign interactions have significantly higher conversion rates

- Longer call duration positively correlates with subscription probability

- High campaign frequency leads to declining response rates (contact fatigue)

- Seniors, students, and medium salary customers show higher subscription likelihood

- Cellular contact outperforms telephone contact

## ▶️ How to Run This Project

- Import the raw dataset into a MySQL database

- Execute SQL scripts for data cleaning and feature engineering

- Refresh the Power BI model and explore the dashboard using slicers

Review the analytical report and presentation for business insights

## 📎 Project Outcome

This project demonstrates the ability to:

- Clean and transform data using SQL in a relational database

- Build meaningful DAX measures

- Design professional, insight-driven dashboards

- Communicate analytical findings through reports and presentations
