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