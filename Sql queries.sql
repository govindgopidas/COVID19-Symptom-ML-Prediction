## Creating a database
create database pandemic;
use pandemic;
## Importing the cleaned data to workbench:
## Righ click on the created database in schemas -> Select table data import wizard ->
## Select the file path to import -> Select destination table and additional options and next ->
## Configure import settings and next -> Again click next to execute

#______________________________________________________________________________________________________________________________

# 1.Find the number of corona patients who faced shortness of breath.

select count(*) from covid_test where Shortness_of_breath = 'True';
#_______________________________________________________________________________________________________________________________

# 2.Find the number of negative corona patients who have fever and sore throat.

select count(*) from covid_test where Test_results='positive' and Fever='True';
#_______________________________________________________________________________________________________________________________

# 3.Group the data by month and rank the number of positive cases.

select month(Test_date) as Month, count(*) as No_of_positive_cases 
from covid_test 
where Test_results='positive' 
group by month(Test_date) 
order by count(*) asc;
#______________________________________________________________________________________________________________________________

# 4.Find the female negative corona patients who faced cough and headache.

select * from covid_test where Sex='female' and Cough='True' and Headache='True' and Test_results='negative';
#_______________________________________________________________________________________________________________________________

# 5.How many elderly corona patients have faced breathing problems?

select count(*) from covid_test where Age_60_above='Yes' and Shortness_of_breath='True';
#_______________________________________________________________________________________________________________________________

# 6.Which three symptoms were more common among COVID positive patients?

select 'Cough' as Symptom,
sum(case when Test_results = 'positive' and Cough = 'True' then 1 else 0 end) as Positive_Count
from covid_test
union
select 'Fever' as Symptom,
sum(case when Test_results = 'positive' and Fever = 'True' then 1 else 0 end) as Positive_Count
from covid_test
union
select 'Sore_throat' as Symptom,
sum(case when Test_results = 'positive' and Sore_throat = 'True' then 1 else 0 end) as Positive_Count
from covid_test
union
select 'Shortness_of_breath' as Symptom,
sum(case when Test_results = 'positive' and Shortness_of_breath = 'True' then 1 else 0 end) as Positive_Count
from covid_test
union
select 'Headache' as Symptom,
sum(case when Test_results = 'positive' and Headache = 'True' then 1 else 0 end) as Positive_Count
from covid_test
order by Positive_Count desc limit 3;
#__________________________________________________________________________________________________________________________________

# 7.Which symptom was less common among COVID negative people?

select 'Cough' as Symptom,
sum(case when Test_results = 'negative' and Cough = 'True' then 1 else 0 end) as Negative_Count
from covid_test
union
select 'Fever' as Symptom,
sum(case when Test_results = 'negative' and Fever = 'True' then 1 else 0 end) as Negative_Count
from covid_test
union
select 'Sore_throat' as Symptom,
sum(case when Test_results = 'negative' and Sore_throat = 'True' then 1 else 0 end) as Negative_Count
from covid_test
union
select 'Shortness_of_breath' as Symptom,
sum(case when Test_results = 'negative' and Shortness_of_breath = 'True' then 1 else 0 end) as Negative_Count
from covid_test
union
select 'Headache' as Symptom,
sum(case when Test_results = 'negative' and Headache = 'True' then 1 else 0 end) as Negative_Count
from covid_test
order by Negative_Count asc limit 3;
#___________________________________________________________________________________________________________________________

# 8.What are the most common symptoms among COVID positive males whose known contact was abroad?

select 'Cough' as Symptom,
sum(case when Test_results = 'positive' and Cough = 'True' then 1 else 0 end) as Positive_Count
from covid_test where Sex = 'male' and Known_contact = 'abroad'
union
select 'Fever' as Symptom,
sum(case when Test_results = 'positive' and Fever = 'True' then 1 else 0 end) as Positive_Count
from covid_test where Sex = 'male' and Known_contact = 'abroad'
union
select 'Sore_throat' as Symptom,
sum(case when Test_results = 'positive' and Sore_throat = 'True' then 1 else 0 end) as Positive_Count
from covid_test where Sex = 'male' and Known_contact = 'abroad'
union
select 'Shortness_of_breath' as Symptom,
sum(case when Test_results = 'positive' and Shortness_of_breath = 'True' then 1 else 0 end) as Positive_Count
from covid_test where Sex = 'male' and Known_contact = 'abroad'
union
select 'Headache' as Symptom,
sum(case when Test_results = 'positive' and Headache = 'True' then 1 else 0 end) as Positive_Count
from covid_test where Sex = 'male' and Known_contact = 'abroad'
order by Positive_Count desc limit 3;
#_______________________________________________________________________________________________________________________________________