

select location_ ,sum(total_deaths) as 'total deaths ' from CovidDeaths where 
continent = 'Europe'  and date = '2020-06-21' and location_ = 'France'
group by location_ 

; 

select location_ ,sum(total_deaths) as 'total deaths ' from CovidDeaths where 
continent in( 'Europe')  and date = '2020-12-21' and location_ = 'France'
group by location_ 

; 
 

--in this query i want to analyse the total of deaths in europe on 21th juny 2020 
--, it is the start of summer and i want to figure out if the weather has an influence in the number of death 
-- and my results were . UK , italy , France ,Spain , Belgium 







--Normally in summer people go out more thant the others seasons , what i want analize 
--if the weather in summer may have an influence in the number of new cases because i will compare it with 
--the total cases of the 21 december as well and my results were in the first place Russia next Ukraine
--in the third place Uk then Germany and finally Belarus 

select  top 5 location_ , new_cases, date  from CovidDeaths
where continent = 'Europe' and date = '2020-06-21'  
order by new_cases desc ;

 


--in this query i want to analyse the new cases  in europe on 21th december 2020 
--, normally in winter people don't go out compared to sumer  and i want to figure out if the weather has an 
--influence in the number of new cases
-- in this query my results were : UK , Russia , Spain , Germany , Netherlands  
select top 5 location_ , new_cases, date  from CovidDeaths
where continent = 'Europe' and date = '2020-12-21'  
order by new_cases desc ;
use project3;


--i want to analyse the top 5 countries whose numbers of deaths decrease 
--between  march and december in europe

select top 5 Location_, total_deaths
from CovidDeaths
where date = '2020-12-01'and continent = 'Europe'
and  total_deaths < (
    select max(total_deaths) -- Get the maximum death count from the top 5 March locations
    from(
        select top 5 total_deaths
        from CovidDeaths
        where date = '2020-03-01'
		and continent = 'Europe'
        order by total_deaths desc
    )as MarchTop5
);




-- It seems that in Europe only 3 countries decrease the number of deaths in december compared to march 

		
		








