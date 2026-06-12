-- Skills for the top paying roles

WITH top_jobs AS (
    SELECT 
        job_title,
        salary_year_avg,
        job_id,
        c.name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim c ON job_postings_fact.company_id = c.company_id
    WHERE
        job_work_from_home = TRUE AND
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT s.skills, count(s.skills) AS skill_count  
FROM top_jobs tj
LEFT JOIN skills_job_dim sj ON tj.job_id = sj.job_id
LEFT JOIN skills_dim s ON sj.skill_id = s.skill_id
GROUP BY s.skills
ORDER BY skill_count DESC
LIMIT 10;
