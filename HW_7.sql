/* 1. �������� �������������, ������� ��� ������� ����� ������� ��������, ����� ���������� ������, ���� ������ �������� ���������� ������ � ������� ������������ ����� �� ���� �������.. */

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






/* 2. ������� �� ���� ������ ��� ����������, ������� ��������� � ������������� � ���������������, ������ 3. ����������� ����������. */

BEGIN TRANSACTION;
DELETE FROM teachers WHERE id = 3; 
DELETE FROM grades_old WHERE teacher_id = 3;
COMMIT;



/* 3. �������� ������� ��� ������� ������������, ������� ��������� �������� ������������ �� ������������ ��������� ����� �� 0 �� 5 ������������. */

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

