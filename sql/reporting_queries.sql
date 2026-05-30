-- Top 20 clubs by number of records
SELECT 
    OrgName,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE OrgName IS NOT NULL AND OrgName <> ''
GROUP BY OrgName
ORDER BY total_records DESC
LIMIT 20;

-- Gender distribution
SELECT 
    Gender,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE Gender IS NOT NULL 
  AND Gender <> ''
GROUP BY Gender
ORDER BY total_records DESC;

-- Sports/activity distribution
SELECT 
    TeamActivity,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE TeamActivity IS NOT NULL AND TeamActivity <> ''
GROUP BY TeamActivity
ORDER BY total_records DESC;

-- Team age distribution
SELECT 
    TeamAge,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE TeamAge IS NOT NULL AND TeamAge <> ''
GROUP BY TeamAge
ORDER BY total_records DESC;

-- Gender distribution by sport/activity
SELECT 
    TeamActivity,
    Gender,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE TeamActivity IS NOT NULL 
  AND TeamActivity <> ''
  AND Gender IS NOT NULL 
  AND Gender <> ''
GROUP BY TeamActivity, Gender
ORDER BY TeamActivity, total_records DESC;

-- Football participation by age group and gender
SELECT 
    TeamAge,
    Gender,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE LOWER(TeamActivity) LIKE '%football%'
  AND TeamAge IS NOT NULL 
  AND TeamAge <> ''
  AND Gender IS NOT NULL 
  AND Gender <> ''
GROUP BY TeamAge, Gender
ORDER BY TeamAge, Gender;

-- Top 20 counties by number of records
SELECT 
    County,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE County IS NOT NULL 
  AND County <> ''
GROUP BY County
ORDER BY total_records DESC
LIMIT 20;

-- Self vs dependent submissions
SELECT 
    SubmittedFor,
    COUNT(*) AS total_records
FROM gaa_raw
WHERE SubmittedFor IS NOT NULL 
  AND SubmittedFor <> ''
GROUP BY SubmittedFor
ORDER BY total_records DESC;