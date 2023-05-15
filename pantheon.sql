-- Top countries by count
SELECT bplace_country, COUNT(*), MAX(hpi), AVG(hpi)
FROM pantheon
GROUP BY 1
ORDER BY 2 DESC

-- Top occupations by count
SELECT occupation, COUNT(*), MAX(hpi), AVG(hpi)
FROM pantheon
GROUP BY 1
ORDER BY 2 DESC

-- Top figure by each occupation
SELECT 
	t1.occupation, 
	t1.name, 
	t2.max_hpi
FROM 
	(SELECT 
		occupation, 
	 	name, 
	 	hpi
	FROM pantheon) t1
JOIN 
	(SELECT 
		occupation, 
	 	MAX(hpi) AS max_hpi
	FROM pantheon
	GROUP BY 1) t2
ON 
	t1.occupation = t2.occupation AND
	t1.hpi = t2.max_hpi
ORDER BY t2.max_hpi DESC

-- Top writer by country
SELECT 
	t3.name, 
	t3.birthyear, 
	t3.deathyear, 
	t3.bplace_country, 
	t3.max_hpi
FROM 
	(SELECT 
		name, 
	 	birthyear,
	 	deathyear, 
	 	bplace_country, 
	 	MAX(hpi) AS max_hpi
	FROM pantheon 
	WHERE occupation = 'WRITER'
	GROUP BY 1, 2, 3, 4) t3
JOIN 
	(SELECT 
	 	bplace_country, 
	 	MAX(max_hpi) AS max_hpi
	FROM 
		(SELECT 
		 	name, 
		 	bplace_country, 
		 	MAX(hpi) AS max_hpi
		FROM pantheon 
		WHERE occupation = 'WRITER'
		GROUP BY 1, 2) t1
	GROUP BY 1) t2
ON
	t2.bplace_country = t3.bplace_country
	AND t2.max_hpi = t3.max_hpi
ORDER BY 5 DESC

-- Top painter by country
SELECT 
	t3.name, 
	t3.birthyear, 
	t3.deathyear, 
	t3.bplace_country, 
	t3.max_hpi
FROM 
	(SELECT 
		name, 
	 	birthyear,
	 	deathyear, 
	 	bplace_country, 
	 	MAX(hpi) AS max_hpi
	FROM pantheon 
	WHERE occupation = 'PAINTER'
	GROUP BY 1, 2, 3, 4) t3
JOIN 
	(SELECT 
	 	bplace_country, 
	 	MAX(max_hpi) AS max_hpi
	FROM 
		(SELECT 
		 	name, 
		 	bplace_country, 
		 	MAX(hpi) AS max_hpi
		FROM pantheon 
		WHERE occupation = 'PAINTER'
		GROUP BY 1, 2) t1
	GROUP BY 1) t2
ON
	t2.bplace_country = t3.bplace_country
	AND t2.max_hpi = t3.max_hpi
ORDER BY 5 DESC

-- Top composer by country
SELECT 
	t3.name, 
	t3.birthyear, 
	t3.deathyear, 
	t3.bplace_country, 
	t3.max_hpi
FROM 
	(SELECT 
		name, 
	 	birthyear,
	 	deathyear, 
	 	bplace_country, 
	 	MAX(hpi) AS max_hpi
	FROM pantheon 
	WHERE occupation = 'COMPOSER'
	GROUP BY 1, 2, 3, 4) t3
JOIN 
	(SELECT 
	 	bplace_country, 
	 	MAX(max_hpi) AS max_hpi
	FROM 
		(SELECT 
		 	name, 
		 	bplace_country, 
		 	MAX(hpi) AS max_hpi
		FROM pantheon 
		WHERE occupation = 'COMPOSER'
		GROUP BY 1, 2) t1
	GROUP BY 1) t2
ON
	t2.bplace_country = t3.bplace_country
	AND t2.max_hpi = t3.max_hpi
ORDER BY 5 DESC


-- Top person in each occupation for the United States
SELECT 
	t3.name, 
	t3.birthyear, 
	t3.deathyear, 
	t3.occupation, 
	t3.max_hpi
FROM 
	(SELECT 
		name, 
	 	birthyear,
	 	deathyear, 
	 	occupation, 
	 	MAX(hpi) AS max_hpi
	FROM pantheon 
	WHERE bplace_country = 'United States'
	GROUP BY 1, 2, 3, 4) t3
JOIN 
	(SELECT 
	 	occupation, 
	 	MAX(max_hpi) AS max_hpi
	FROM 
		(SELECT 
		 	name, 
		 	occupation, 
		 	MAX(hpi) AS max_hpi
		FROM pantheon 
		WHERE bplace_country = 'United States'
		GROUP BY 1, 2) t1
	GROUP BY 1) t2
ON
	t2.occupation = t3.occupation
	AND t2.max_hpi = t3.max_hpi
ORDER BY 5 DESC

-- Top person in each occupation for the United Kingdom
SELECT 
	t3.name, 
	t3.birthyear, 
	t3.deathyear, 
	t3.occupation, 
	t3.max_hpi
FROM 
	(SELECT 
		name, 
	 	birthyear,
	 	deathyear, 
	 	occupation, 
	 	MAX(hpi) AS max_hpi
	FROM pantheon 
	WHERE bplace_country = 'United Kingdom'
	GROUP BY 1, 2, 3, 4) t3
JOIN 
	(SELECT 
	 	occupation, 
	 	MAX(max_hpi) AS max_hpi
	FROM 
		(SELECT 
		 	name, 
		 	occupation, 
		 	MAX(hpi) AS max_hpi
		FROM pantheon 
		WHERE bplace_country = 'United Kingdom'
		GROUP BY 1, 2) t1
	GROUP BY 1) t2
ON
	t2.occupation = t3.occupation
	AND t2.max_hpi = t3.max_hpi
ORDER BY 5 DESC

-- Top person born in each year, reaching a threshold of 75 hpi
