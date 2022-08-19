/* 1. �������� ���������� �� �������.� ����� �������� ����� ������, �������� ����� � ���� ������ �������. */

SELECT
   streams.number AS stream_number,
   courses.name AS course_name,
   started_at
FROM streams
   INNER JOIN courses
      ON streams.id = courses.id;


/* 2. ������� ����� ���������� �������� ��� ������� �����.
� ����� �������� �������� ����� � ���������� �������� �� ���� ������� �����. */

SELECT
   courses.name AS course_name,
   sum(students_amount) AS amount_ours
FROM streams
  INNER JOIN courses
  ON streams.course_id = courses.id
GROUP BY courses.name;
 

/* 3. ��� ���� �������� ������� ������� ������ �� ���� ���������� �������.
� ����� �������� �������������, ������� � ��� �������, ������� ������ �� ���� ����������� �������. ����� ����� �������, � ������� �� ���� �������, ����� ������ � �������. */

SELECT 
   teachers.id,
   teachers.surname,
   teachers.name,
   AVG(perfomance) AS avg_grade
FROM teachers
   LEFT JOIN grades_old
	 ON teachers.id = grades_old.teacher_id
GROUP BY teachers.id;


/* ��� ������� ������������� �������� ���, �������, ����������� �������� ������������ �� ���� ������� �������������, �������� �����, ������� ������������� ������ � ����������� ��������� ������������, ������������ �������� ������������ �� ���� ������� �������������, �������� �����, ��������������� ������ � ������������ ��������� ������������, ���� ������ ���������� ������. */
 
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

   

/* ��������� ������� �� ������...
�� ����� ��� ����������� ������������� ������� ������..�� �� ���������� � ������ ������� ��� ����, ������������� �������� ������ ���������� �� ���������� ���������.
 */