/* 1. ѕокажите информацию по потокам.¬ отчет выведите номер потока, название курса и дату начала зан€тий. */

SELECT
   streams.number AS stream_number,
   courses.name AS course_name,
   started_at
FROM streams
   INNER JOIN courses
      ON streams.id = courses.id;


/* 2. Ќайдите общее количество учеников дл€ каждого курса.
¬ отчЄт выведите название курса и количество учеников по всем потокам курса. */

SELECT
   courses.name AS course_name,
   sum(students_amount) AS amount_ours
FROM streams
  INNER JOIN courses
  ON streams.course_id = courses.id
GROUP BY courses.name;
 

/* 3. ƒл€ всех учителей найдите среднюю оценку по всем проведЄнным потокам.
¬ отчЄт выведите идентификатор, фамилию и им€ учител€, среднюю оценку по всем проведенным потокам. ¬ажно чтобы учител€, у которых не было потоков, также попали в выборку. */

SELECT 
   teachers.id,
   teachers.surname,
   teachers.name,
   AVG(perfomance) AS avg_grade
FROM teachers
   LEFT JOIN grades_old
	 ON teachers.id = grades_old.teacher_id
GROUP BY teachers.id;


/* ƒл€ каждого преподавател€ выведите им€, фамилию, минимальное значение успеваемости по всем потокам преподавател€, название курса, который соответствует потоку с минимальным значением успеваемости, максимальное значение успеваемости по всем потокам преподавател€, название курса, соответствующий потоку с максимальным значением успеваемости, дату начала следующего потока. */
 
SELECT 
   teachers.id,
   teachers.surname,
   teachers.name,
   MIN(perfomance) ,
	courses.name 
FROM teachers
   LEFT JOIN grades_old
	 ON teachers.id = grades_old.teacher_id
   LEFT JOIN streams
	 ON grades_old.stream_id = streams.id
   LEFT JOIN courses
	 ON streams.course_id = courses.id

   GROUP BY grades_old.teacher_id; 

   

/* ѕоследнее задание не осилил...
не пон€л как выдергивать идентификатор таблицы курсов..мы же обращаемс€ к табице оцкенок два раза, сответственно название курсов одинаковое по последнему обращению.
 */