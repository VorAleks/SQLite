/* 1. ������� ����� ���������� �������� ��� ������� �����. � ����� �������� �������� ����� � ���������� �������� �� ���� ������� �����. ������ ������� � ����������� ������� �������. */

SELECT DISTINCT
   courses.name AS course_name,
   sum(students_amount)OVER(PARTITION BY courses.id)
	AS amount_students
FROM streams
  INNER JOIN courses
  ON streams.course_id = courses.id;



/* 2. ������� ������� ������ �� ���� ������� ��� ���� ��������. � ����� �������� �������������, ������� � ��� �������, ������� ������ �� ���� ���������� �������. �������, � ������� �� ���� �������, ����� ������ ������� � �������. ������ ������� � ����������� ������� �������. */

SELECT DISTINCT
   teachers.id,
   teachers.surname,
   teachers.name,
   AVG(perfomance) OVER(PARTITION BY teachers.id) AS avg_grade
FROM teachers
   LEFT JOIN grades_old
      ON grades_old.teacher_id = teachers.id;


/* 3. ����� ������� ���� ������� ��� ����������� �������� ���������� ��������������� �������? */

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



/* 4. ���������� SQLiteStudio, ���������� ���� ������ ��������, ��������� � ����������� ������� ����� ������. */


 