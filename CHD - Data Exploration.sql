--selecting all values from the framingham2 data table
select * from [CHD Database].dbo.framingham2

-- selecting the people having the risk of 10 year CHD
select * from [CHD Database]..framingham2
where TenYearCHD = 1
order by 2 asc

--observing the level of education among the people within rich
select MAX(education) "Max. Education Level", Min(education) "Min. Education Level" from [CHD Database]..framingham2
where TenYearCHD = 1

---- select number of male at risk of being affected
select count(TenYearCHD) "Male at Risk" from [CHD Database].dbo.framingham2
where male = 1 and TenYearCHD = 1

--- select number of female at risk of being affected
select count(TenYearCHD) "Female at Risk" from [CHD Database].dbo.framingham2
where male = 0 and TenYearCHD = 1

--- checking the maximum and minimum age af a woman at risk
select MAX(age) "Max. Age", Min(age) as "Min. Age" from [CHD Database]..framingham2
where male = 0 and TenYearCHD = 1

--- checking the maximum and minimum age af a man at risk
select MAX(age) "Max. Age", Min(age) as "Min. Age" from [CHD Database]..framingham2
where male = 1 and TenYearCHD = 1

-- average Cholostret for people at risk
select AVG(totChol) "Avg. Cholostrol" from [CHD Database]..framingham2
where TenYearCHD = 1

-- selecting diabetes patient group at risk
select diabetes, COUNT(TenYearCHD) "People at CHD Risk" from [CHD Database].dbo.framingham2
where TenYearCHD = 1
group by diabetes

-- selecting gender-wise people at risk
select male "Male or Female", count(TenYearCHD) as "Avg. People at Risk" from [CHD Database].dbo.framingham2
where TenYearCHD = 1
group by male

-- create a view to show heath related data at one go
create view showhealthdata as
select totChol, sysBP, diaBP, BMI, heartRate, glucose 
from [CHD Database]..framingham2
where TenYearCHD = 1

select * from showhealthdata