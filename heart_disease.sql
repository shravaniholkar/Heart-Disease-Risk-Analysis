create database heart_diseasee;
use heart_diseasee;

create table if not exists heart_disease(
patient_id int primary key,
age float,
anaemia int,
creatinine_phosphokinase int,
diabetes int,
ejection_fraction int,
high_blood_pressure int,
platelets float,
serun_creatinine float,
serum_sodium int,
sex int,
smoking int,
time int,
Death_Event int,
age_group varchar(10),
sex_label varchar(30),
ejection_risk varchar(20),
creatinine_risk varchar(10));

select *from heart_disease;

select count(*) from heart_disease;

#kpi's
select count(*) as Total_Patients,
sum(Death_Event) as Total_Deaths,
count(*)-sum(Death_Event) as Total_survived,
sum(case when sex=1 then 1 else 0 end) as Male_count,
sum(case when sex=0 then 1 else 0 end) as Female_count,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate,
round(avg(age),1) as Avg_patient_age
from heart_disease;

#Which age band has the highest death rate?
select age_group,
count(*) as Total_Patients,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate,
round(avg(ejection_fraction),1) as avg_ejection_fraction,
round(avg(serum_creatinine),1) as avg_serum_creatinine
from heart_disease
group by age_group
order by Mortality_rate;

#Patients with ejection fraction < 30% are critically at risk.
select ejection_risk,
count(*) as Total_Patients,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate,
round(avg(serum_creatinine),1) as avg_serum_creatinine,
round(avg(age),1) as Avg_patient_age
from heart_disease
group by ejection_risk
order by Mortality_rate desc;

#serium_creatinine risk analysis
select creatinine_risk,
count(*) as Total_Patients,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate,
round(avg(age),1) as Avg_patient_age,
round(avg(ejection_fraction),1) as avg_ejection_fraction,
round(avg(serum_sodium),1)  as avg_serum_sodium
from heart_disease
group by creatinine_risk
order by Mortality_rate desc;

#gender wise different risk profiles
select sex_label as gender,
count(*) as Total_Patients,
round(avg(age),1) as Avg_patient_age,
sum(Death_Event) as Total_Deaths,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate,
sum(anaemia) as anaemia_count,
sum(diabetes) as diabetes_count,
sum(high_blood_pressure) as hpb,
sum(anaemia) as anaemia_count,
sum(smoking) as smoker_count,
round(avg(ejection_fraction),1) as avg_ejection_fraction
from heart_disease 
group by sex_label;

#patients with MULTIPLE risk factors
select patient_id,
age,
sex_label                                               AS gender,
ejection_fraction,
serum_creatinine,
serum_sodium,
high_blood_pressure,
diabetes,
anaemia,
smoking,
death_event,
(
case when age>65 then 1 else 0 end +
case when anaemia=1 then 1 else 0 end +
case when diabetes=1 then 1 else 0 end +
case when ejection_fraction<30 then 1 else 0 end +
case when high_blood_pressure=1 then 1 else 0 end +
case when serum_creatinine>1.5 then 1 else 0 end +
case when serum_sodium<130 then 1 else 0 end +
case when smoking=1 then 1 else 0 end )
as risk_score
from heart_disease
order by risk_score desc
limit 20;

#Did longer follow-up correlate with better survival?
select
case
when time<=60  then '0-60 days'
when time<=120 then '61-120 days'
when time<=180 then '121-180 days'
else '181+ days'
end  as followup_period,
count(*) as Total_Patients,
sum(Death_Event) as Total_Deaths,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate,
round(avg(ejection_fraction),1) as avg_ejection_fraction
from heart_disease
group by followup_period;

#SERUM SODIUM, sodium < 135 is a heart failure marker
select 
case when serum_sodium < 130 then 'Severe Hyponatremia'
when serum_sodium < 135 then 'Mild Hyponatremia (130-134)'
when serum_sodium <= 145 then 'Normal(135-145)'
else 'Hypernatremia (>145)'
end as sodium_category,
count(*) as Total_Patients,
sum(Death_Event) as Total_Deaths,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate,
round(avg(ejection_fraction),1) as avg_ejection_fraction
from heart_disease
group by sodium_category
order by Mortality_rate desc;								

#Ejection fraction + serum creatinine - strongest predictors
select 
case when ejection_fraction < 30 AND serum_creatinine > 1.5 then 'Both Critical'
when ejection_fraction < 30 AND serum_creatinine <= 1.5 then 'low ef only'
when ejection_fraction >= 30 AND serum_creatinine > 1.5 then 'High creatinine only'
end as critical_combo_factor,
count(*) as Total_Patients,
sum(Death_Event) as Total_Deaths,
round(sum(Death_Event) * 100 / count(*),2) as Mortality_rate
from heart_disease
group by critical_combo_factor
order by Mortality_rate desc;

