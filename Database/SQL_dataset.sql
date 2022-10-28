SELECT * FROM demographic;
SELECT bmi, age FROM demographic;
SELECT bmi FROM demographic
WHERE bmi>35;
SELECT DISTINCT bmi FROM demographic
WHERE bmi>50;
SELECT bmi, age, weight, height FROM demographic
ORDER BY age ASC;
SELECT age, bmi, hospital_death FROM demographic
WHERE hospital_death=TRUE
ORDER BY age ASC
LIMIT 10 OFFSET 100;
SELECT ethnicity, aggregate(bmi)
FROM demographic
GROUP BY ethnicity;