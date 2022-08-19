/* 1. Создайте представление, которое для каждого курса выводит название, номер последнего потока, дату начала обучения последнего потока и среднюю успеваемость курса по всем потокам.. */

CREATE VIEW courses_info AS
SELECT
   courses.name AS course_name,
   streams.number AS number_last_stream,
   MAX(started_at),
   AVG(perfomance)
FROM streams
   LEFT JOIN courses
      ON courses.id  = streams.course_id
   LEFT JOIN grades_old
      ON streams.id = grades_old.stream_id
	 GROUP BY streams.course_id;






/* 2. Удалите из базы данных всю информацию, которая относится к преподавателю с идентификатором, равным 3. Используйте транзакцию. */

BEGIN TRANSACTION;
DELETE FROM teachers WHERE id = 3; 
DELETE FROM grades_old WHERE teacher_id = 3;
COMMIT;



/* 3. Создайте триггер для таблицы успеваемости, который проверяет значение успеваемости на соответствие диапазону чисел от 0 до 5 включительно. */

CREATE TRIGGER check_perfomance BEFORE INSERT
ON grades
BEGIN
   SELECT CASE
   WHEN
     (NEW.perfomance NOT BETWEEN 0 AND 5)
   THEN
     RAISE(ABORT, 'Perfomance is not between 0 and 5 !')
   END;
END;

