-- Skills for the top paying roles

SELECT
    s.skills,
    count(s.skills) AS skill_count
FROM job_postings_fact j
INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY s.skills
ORDER BY skill_count DESC
LIMIT 15;