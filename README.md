Heart Disease Analysis Project
--------------------------------------------------------------------------------------------------
<img width="1379" height="778" alt="Overview Dashboard" src="https://github.com/user-attachments/assets/5a4be174-dd39-4ebf-acaf-056026717c9f" />
 
<img width="1379" height="774" alt="Clinical Risk Analysis" src="https://github.com/user-attachments/assets/d46fe259-df66-482d-a6fd-a068c5b8fcbb" />

---------------------
Project Overview
-----------------------------------------
This Report provides an end-to-end analysis of Heart Disease Patients to help hospital management identify critical health patterns and improve patient outcomes.The dashboard helps hospital management and cardiology departments detect high-risk patients early and support data-driven clinical decisions.

------------------------------------------
Business Problem
------------------------------------------------------------------------------------------------------
The hospital cardiology department is experiencing a high patient mortality rate.Hospital management lacks visibility into which patient profiles are at highest risk,making it impossible to prioritise early intervention before a patient's condition becomes critical.

Objectives
-----------------------
- Analyze the demographics of heart disease patients by gender and age.
- Identify which clinical markers are the strongest predictors of death.
- Monitor mortality and survival trends.
- Enable early intervention for critical patients.
- Support hospital decision-making for better treatment planning.
- Enhance data-driven health management through actionable visuals.

-------------
Technical Details
---------------------
| Tool       | Purpose              |
| ---------- | -------------------- |
| Python     | Data Cleaning & EDA  |
| Matplotlib / Seaborn | EDA Visualizations  |
| MySQL | SQL business analysis |
| Power BI   | Dashboard Creation   |
| Microsoft Excel | Raw data source |

-------------------
Project Workflow
------------------------------
Data Collection  
↓  
Data Cleaning & Preprocessing  
↓  
Exploratory Data Analysis (EDA)  
↓  
Risk Factor Analysis  
↓  
Power BI Dashboard Development  
↓  
Business Insights & Recommendations

----------
Key Insights
--------------------
Demographic Analysis
- Male patients represented a larger proportion of heart disease cases compared to female patients.
- Older age groups, especially patients above 60 years, showed significantly higher mortality rates.
- Younger patients had comparatively better survival outcomes.

Clinical Predictors of Death
- Low ejection fraction emerged as one of the strongest indicators of mortality risk.
- Elevated serum creatinine levels showed a strong association with patient deaths,indicating kidney related complications.
- Mortality differences between comorbidities(hbp,diabetes,anemia,smoking) were relatively similar compared to stronger indicators like ejection fraction and serum creatinine.

Mortality & Survival Trends
- The dataset revealed a mortality rate of approximately 32%, while survival rate remained around 68%.
- Mortality increased significantly among patients with multiple critical clinical conditions.
- Survival rates were higher among patients with normal heart function indicators.

High-Risk Patient Identification
- Patients with combined risk factors such as advanced age, low ejection fraction, and elevated creatinine levels were identified as critical-risk patients.
- Patients with multiple comorbidities such as diabetes,anaemia,smoking and high blood pressure showed elevated clinical risk.

Business & Healthcare Impact
- The dashboard enables hospitals to identify critical patients early for timely intervention.
- Interactive visualizations support data-driven treatment planning and clinical decision-making.
- Healthcare professionals can use the insights to prioritize monitoring and improve patient care outcomes.

-------------------
Business Recommendations
------------------------------
- Implement early warning systems for high-risk patients.
- Increase monitoring for elderly cardiac patients and patients with multiple comorbidities.
- Encourage regular cardiac health assessments and follow-up monitoring for critical patients.
- Use predictive analytics models to improve mortality risk prediction and proactive treatment planning.

---------------
Files in This Repository
---------------------------------
hospital project-checkpoint.ipynb

Jupyter Python notebook covering data cleaning, EDA , visualizations and insights

-----------------------------

heart_disease.sql

SQL queries for KPI validation, demographic segmentation and risk analysis

-------------------------------

PowerBI Dashboard

Interactive visualization summarizing patient risk patterns

------------------------
Author
-----------
Created by: Shravani Holkar

shravaniholkar575@gmail.com
