create database project;

use project;

select * from dp;

select count(*) from dp;

#1 Retrieve the Patient_id and ages of all patients.

select Patient_id,age
from dp; 

#2 Select all female patients who are older than 30. 

select Patient_id,gender,age
from dp
where gender="female" and age>30;

#3 Calculate the average BMI of patients. 

select avg(bmi) as average_bmi
from dp;

#4 List patients in descending order of blood glucose levels. 

select *
from dp
order by blood_glucose_level
desc;

#5 Find patients who have hypertension and diabetes. 

select Patient_id,hypertension,diabetes
from dp
where hypertension=1 and diabetes=1;

#6 Determine the number of patients with heart disease. 

select count(heart_disease) as number_of_heart_disease
from dp
where heart_disease=1;

#7 Group patients by smoking history and count how many smokers and non- smokers there are

select smoking_history,count(*) as count_of_smokers
from dp
group by smoking_history;

#8 Retrieve the Patient_id of patients who have a BMI greater than the average BMI. 

select  Patient_id,bmi
from dp
where bmi >(select avg(bmi) from dp);

#9 Find the patient with the highest HbA1c level and the patient with the lowest HbA1clevel

select max(HbA1c_level) as highestg_HbA1c_level,min(HbA1c_level) as lowest_HbA1c_level
from dp;

#10 Rank patients by blood glucose level within each gender group. 

SELECT 
    Patient_id,  
    gender,
    blood_glucose_level,
    RANK() OVER (PARTITION BY gender ORDER BY blood_glucose_level DESC) AS rank_within_gender
FROM 
    dp;
    
#11 Insert a new patient into the database with sample data. 

insert into dp(EmployeeName,Patient_id,gender,
D.O.B,hypertension,heart_disease,
smoking_history,bmi,
HbA1c_level,blood_glucose_level,diabetes
) values(
"karan patel","PT 62606","Male",
"23-02-1993",0,"never",
50,5.5,130,0);

#12 Delete all patients with heart disease from the database. 

delete from dp
where heart_disease = 1;

select Patient_id,heart_disease
from dp
where heart_disease=1;

#13 Find patients who have hypertension but not diabetes using the EXCEPT operator. 

select Patient_id,EmployeeName
from dp
where hypertension='1'
EXCEPT
select Patient_id,EmployeeName
from dp
where diabetes='1';

#14 Create a view that displays the Patient_ids, ages, and BMI of patients. 

create view dp_view as
select Patient_id,age,bmi
from dp;

select * from dp_view;

