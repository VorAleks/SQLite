UPDATE streams SET started_at = substr(started_at, 7,4) || '-' || 
	substr(started_at, 4, 2) || '-' || substr(started_at, 1, 2);

SELECT id, number, MAX(started_at) FROM streams;
/* можно и так SELECT id, number FROM streams ORDER BY started_at DESC LIMIT 1; */

SELECT DISTINCT(strftime('%Y',started_at)) AS unique_year FROM streams;

select COUNT(id) AS total_count FROM teachers;

select started_at FROM streams ORDER BY started_at DESC LIMIT 2;

select AVG(perfomance) FROM grades_old WHERE teacher_id=1;

select teacher_id, AVG(perfomance) AS avg_per FROM grades_old GROUP BY teacher_id HAVING avg_per < 4.8;

