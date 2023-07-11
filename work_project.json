--необходимо определить кол-во учеников с уровнем Elementary
select count(*)
from student 
where level = 'Elementary';

--сгруппировать учеников по уровню владения англ
select level,
count (*)
from student
group by level;

--определить общ кол-во школы 
--для каждого из уровней элементари и интермедиат
--только для двух этих

select level,
count(*)
from student
where level in ('Elementary','Intermediate')
group by level

/* определить общее кол-во учащихся
для каждого уровня с учетом формы индивид. и групповой
*/
select level, education_form,
count(*)
from student
group by level, education_form

--определить общее колич учащихся школы для каждого уровня
/*среди сгруппированных данныъ найти уровни где кол-во уч больше 300
*/
select level, count (*)
from student
group by level
having count (*) > 300;

/*
общее кол-во учащихся среди всех уровней
где кол-во учачищхся не равно нулю
*/
select level,
count(*)
from student
group by level
having count(*) <> 0;

/*
определить колво учеников для каждого предмета
и вывести предметы в порядке убывания кол-ва
учеников изучающих предмет */

select subject_id, count (*)
from users
group by subject_id
order by count desc
