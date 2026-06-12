
-- Top paying data jobs
SELECT job_title_short, TRUNC(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
GROUP BY job_title_short
ORDER BY avg_salary DESC
LIMIT 10;

-- Top 10 available remotely
SELECT 
    j.job_title,
    j.job_location,
    j.salary_year_avg,
    c.name AS company_name
FROM job_postings_fact AS j
LEFT JOIN company_dim c ON j.company_id = c.company_id
WHERE
    job_work_from_home = TRUE AND
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;







