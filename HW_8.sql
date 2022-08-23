/* 1. Найдите общее количество учеников для каждого курса. В отчёт выведите название курса и количество учеников по всем потокам курса. Решите задание с применением оконных функций. */

SELECT DISTINCT
   courses.name AS course_name,
   sum(students_amount)OVER(PARTITION BY courses.id)
	AS amount_students
FROM streams
  INNER JOIN courses
  ON streams.course_id = courses.id;



/* 2. Найдите среднюю оценку по всем потокам для всех учителей. В отчёт выведите идентификатор, фамилию и имя учителя, среднюю оценку по всем проведённым потокам. Учителя, у которых не было потоков, также должны попасть в выборку. Решите задание с применением оконных функций. */

SELECT DISTINCT
   teachers.id,
   teachers.surname,
   teachers.name,
   AVG(perfomance) OVER(PARTITION BY teachers.id) AS avg_grade
FROM teachers
   LEFT JOIN grades_old
      ON grades_old.teacher_id = teachers.id;


/* 3. Какие индексы надо создать для максимально быстрого выполнения представленного запроса? */

CREATE INDEX streams_number_idx ON streams(number);

SELECT
  surname,
  name,
  number,
  performance
FROM academic_performance
  JOIN teachers 
    ON academic_performance.teacher_id = teachers.id
  JOIN streams
    ON academic_performance.stream_id = streams.id
WHERE number >= 200;    



/* 4. Установите SQLiteStudio, подключите базу данных учителей, выполните в графическом клиенте любой запрос. */


 