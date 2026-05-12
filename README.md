![Power BI](https://img.shields.io/badge/Tool-PowerBI-yellow)
![SQL](https://img.shields.io/badge/Database-OracleSQL-red)
![Healthcare Analytics](https://img.shields.io/badge/Domain-Healthcare-blue)

# Pharmacy Rebate Analytics Dashboard

## About This Project
This project demonstrates an end-to-end healthcare analytics solution using Oracle SQL and Power BI. It includes data processing, KPI validation, and interactive dashboard development for pharmacy rebate analysis.

## Project Overview
Developed an interactive Power BI dashboard to analyze pharmacy rebate performance, drug costs, claims, and therapeutic class trends. The dashboard enables stakeholders to monitor financial performance and drill into detailed claim-level analytics.

## Business Problem
Pharmacy benefit organizations must closely monitor rebate performance, drug costs, and claims activity to reduce financial leakage and optimize reimbursement strategies. Manual analysis of rebate data can make it difficult to identify underperforming therapeutic classes, high-cost drugs, and rebate discrepancies across plans and claims.

## Objectives
- Track pharmacy rebate performance
- Analyze total cost vs net cost
- Monitor rebate variance trends
- Identify top rebate-generating drugs
- Enable claim-level drill-through analysis
- Detect rebate leakage by comparing actual vs expected rebate amounts across drugs and therapeutic classes

## Dataset Description
The project uses simulated pharmacy and rebate datasets stored in CSV format to replicate real-world PBM and healthcare rebate analysis scenarios. The datasets were integrated and transformed in Power BI to support KPI reporting, variance analysis, and claim-level drill-through analytics.

**Datasets Included**
| Dataset                   | Description                                                                                                                 |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Claims Data               | Contains claim-level transaction data including claim ID, drug ID, plan ID, quantity, total cost, and rebate amount         |
| Drugs Master Data         | Includes drug attributes such as drug name, drug ID, and therapeutic class                                                  |
| Rebate Data               | Contains rebate-related information including drug ID and rebate rate used to calculate expected rebate values              |
| Plans Information         | Stores payer and insurance plan details used for plan-level rebate and cost analysis                                        |

## Tools & Technologies
- Power BI
- Oracle SQL
- DAX Measures
- Power Query
- Data Modeling
- Data Visualization
- Excel / CSV Data Sources

## Data Workflow
- Imported pharmacy claims, drug, plan, and rebate datasets from CSV files into Power BI
- Performed data cleaning and transformation using Power Query
- Designed a relational data model connecting claims, drugs, plans, and rebate tables
- Created DAX measures for rebate KPIs, variance analysis, and financial reporting
- Developed interactive dashboards with drill-through and dynamic filtering capabilities
- Imported CSV datasets into Oracle SQL Developer and performed analytical querying for rebate analysis, KPI calculations, joins, and trend analysis.
- SQL scripts were used to validate rebate logic and compute KPIs, while Power BI was used for interactive dashboards and visual storytelling.

## Key Features
- Interactive slicers and filters
- KPI tracking dashboard
- Trend analysis
- Drill-through claim details
- Rebate variance monitoring

## Technical Highlights
- Built reusable DAX measures for KPI calculations and variance tracking
- Implemented drill-through pages for claim-level investigation
- Applied conditional formatting to highlight rebate performance trends
- Designed interactive slicers for therapeutic class, drug, and plan-level filtering
- Developed relational data modeling to support scalable analytics
- Developed DAX measures for Total Rebate, Expected Rebate, Net Cost, and Rebate Variance analysis

## KPIs
- Total Claims
- Total Cost
- Total Rebate
- Net Cost
- Rebate %
- Rebate Variance %

## Business Insights
- Identified Immunology as the highest rebate-contributing therapeutic class across total claims and rebate recovery
- Detected rebate variance fluctuations where actual rebates fell below expected rebate thresholds, indicating potential rebate leakage
- Highlighted high-cost, high-rebate drugs contributing disproportionately to overall pharmacy spend
- Enabled claim-level analysis to support financial investigation and rebate performance monitoring

## Dashboard Screenshots

### 1. Rebate Overview – Default View
Provides a high-level summary of rebate performance, claim metrics, and cost distribution across all therapeutic classes.
<img src="screenshots/powerbi/1. Rebate Overview – Default View.png" />


### 2. Rebate Overview – Filtered by Therapeutic Class
Displays rebate trends, top drugs, and KPI changes after filtering by a selected therapeutic class.
<img src="screenshots/powerbi/2. Rebate Overview – Filtered by Therapeutic Class.png" />


### 3. Claim Details – Therapeutic Class Analysis
Shows claim-level transaction details and rebate performance for the selected therapeutic class.
<img src="screenshots/powerbi/3. Claim Details – Therapeutic Class Analysis.png" />


### 4. Rebate Overview – Filtered by Drug Name
Displays rebate trends and KPI changes after selecting a specific drug.
<img src="screenshots/powerbi/4. Rebate Overview – Filtered by Drug Name.png" />


### 5. Claim Details – Drug Name Analysis
Provides detailed claim-level insights, rebate values, and cost analysis for the selected drug.
<img src="screenshots/powerbi/5. Claim Details – Drug Name Analysis.png" />

## Backend SQL Analysis (Oracle SQL)
The pharmacy rebate datasets were imported into Oracle SQL Developer to perform backend analysis, KPI validation, and business insights before visualization in Power BI.

SQL was used to validate and compute core KPIs (rebate %, variance, net cost), which were then visualized in Power BI dashboards for business reporting.

---

## SQL Scripts Included

| Script | Purpose |
|------|--------|
| 01_top_rebate_drugs.sql | Identifies highest rebate-generating drugs |
| 02_rebate_leakage_analysis.sql | Detects potential rebate leakage between expected vs actual rebate |
| 03_plan_performance.sql | Analyzes cost and rebate performance by insurance plan |
| 04_therapeutic_class_analysis.sql | Evaluates rebate trends by therapeutic class |
| 05_monthly_rebate_trends.sql | Tracks monthly cost and rebate trends |
| 06_claims_summary.sql | Provides overall KPI summary (claims, cost, rebate, net cost) |
| 07_high_cost_drugs.sql | Identifies high-cost drugs and financial impact |
| 08_rebate_variance_by_drug.sql | Measures variance between expected and actual rebate |
| 09_high_cost_claims.sql | Identifies high-cost pharmacy claims and analyzes rebate-adjusted financial impact |

---

## Oracle SQL Screenshots

### 1. Database Schema
<img src="screenshots/sql/1_database_tables.png" />

### 2. KPI Summary Query
<img src="screenshots/sql/4_kpi_analysis.png" />

### 3. Rebate Leakage Analysis
<img src="screenshots/sql/5_rebate_leakage_analysis.png" />

### 4. High Cost Drug Analysis
<img src="screenshots/sql/7_high_cost_drugs.png" />

### 5. High Cost Claims Analysis
<img src="screenshots/sql/8_high_cost_claims.png" />


## SQL Skills Demonstrated
- Joins
- Aggregations
- CASE Statements
- GROUP BY
- Data Cleaning
- KPI Calculations

## Key Skills Demonstrated
- Power BI Dashboard Development
- Data Visualization
- Data Modeling & Transformation
- DAX Calculations & Measures
- Business Performance Analysis
- Interactive Dashboard Design
- Drill-through & Detail-Level Analytics

## Impact
- Improved visibility into rebate performance and cost distribution
- Enabled faster identification of rebate leakage patterns
- Provided stakeholders with self-service analytics through interactive dashboards
  


