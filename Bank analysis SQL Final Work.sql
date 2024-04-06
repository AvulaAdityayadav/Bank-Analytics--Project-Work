create schema Bank_loan_Project;
use bank_loan_project;
select count(*) from finance_1;
Select * from  finance_1;


select count(*) from finance_2;
Select * from finance_2;

Use bank_loan_project;

--  1)Year wise loan amount Stats
Select year(issue_D) as Year_of_issue_d, sum(loan_amnt) as Total_loan_amnt
From finance_1
group by Year_of_issue_d
order by Year_of_issue_d;

-- 2)Grade and sub grade wise revol_bal
select
grade,sub_grade,sum(revol_bal)as total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id =finance_2.id)
group by grade ,sub_grade
order by grade ,sub_grade;

-- 3)Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status,round(sum(total_pymnt),2) as total_payment
from finance_1 inner join finance_2
on(finance_1.id =finance_2.id)
group by verification_status;

-- 4)State wise and month wise loan status
Select addr_state,loan_status
from finance_1
loan_status
order by loan_status;

Select addr_state,loan_status,last_credit_pull_D
from finance_1 inner join finance_2
on(finance_1.id =finance_2.id)
group by addr_state,loan_status,last_credit_pull_D
order by loan_status;

-- 5)Home ownership Vs last payment date stats
select home_ownership,last_pymnt_d
from finance_1 inner join finance_2
on(finance_1.id =finance_2.id)
group by home_ownership,last_pymnt_d
order by home_ownership,last_pymnt_d;


