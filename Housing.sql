-- PART 1: DESCRIPTIVE / GROUP-BY

-- NT: Property type
SELECT property_type, COUNT(*) n, ROUND(AVG(price_num)) avg_price,
ROUND(AVG(bedrooms),2) avg_bed, ROUND(AVG(bathrooms),2) avg_bath,
ROUND(AVG(parking_spaces),2) avg_park, ROUND(AVG(land_size_m2)) avg_land
FROM RealEstateAU_NT_clean
GROUP BY property_type ORDER BY n DESC;

-- NT: Price by bedrooms
SELECT bedrooms, COUNT(*) n, ROUND(AVG(price_num)) avg_price,
MIN(price_num) mn, MAX(price_num) mx
FROM RealEstateAU_NT_clean
WHERE price_num IS NOT NULL AND bedrooms IS NOT NULL
GROUP BY bedrooms;

-- NT: Top suburbs
SELECT suburb, COUNT(*) n, ROUND(AVG(price_num)) avg_price
FROM RealEstateAU_NT_clean
GROUP BY suburb HAVING n >= 15
ORDER BY avg_price DESC;

-- NT: Price type
SELECT price_type, COUNT(*) n, COUNT(price_num) with_price
FROM RealEstateAU_NT_clean
GROUP BY price_type;

-- NT: Price by bathrooms
SELECT bathrooms, COUNT(*) n, ROUND(AVG(price_num)) avg_price
FROM RealEstateAU_NT_clean
WHERE price_num IS NOT NULL
GROUP BY bathrooms;

-- MELB: Property type
SELECT Type, COUNT(*) n, ROUND(AVG(Price)) avg_price,
ROUND(AVG(Rooms),2) rooms, ROUND(AVG(Bathroom),2) bath,
ROUND(AVG(Car),2) car, ROUND(AVG(Landsize)) land,
ROUND(AVG(Distance),1) dist
FROM melb_data_clean
GROUP BY Type;

-- MELB: Price by rooms
SELECT Rooms, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Rooms;

-- MELB: Price by bathrooms
SELECT Bathroom, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Bathroom;

-- MELB: Price by distance
SELECT CASE
WHEN Distance < 5 THEN '0-5'
WHEN Distance < 10 THEN '5-10'
WHEN Distance < 15 THEN '10-15'
WHEN Distance < 20 THEN '15-20'
WHEN Distance < 30 THEN '20-30'
ELSE '30+'
END band,
COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean
GROUP BY band ORDER BY MIN(Distance);

-- MELB: Region
SELECT Regionname, COUNT(*) n, ROUND(AVG(Price)) avg_price,
ROUND(AVG(Distance),1) dist
FROM melb_data_clean
GROUP BY Regionname ORDER BY avg_price DESC;

-- MELB: Price by decade
SELECT (CAST(YearBuilt AS INT)/10)*10 decade,
COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean
WHERE YearBuilt >= 1850
GROUP BY decade;

-- MELB: Sale method
SELECT Method, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Method;

-- MELB: Price by car spaces
SELECT Car, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Car;


-- PART 1: DESCRIPTIVE / GROUP-BY

-- NT: Property type
SELECT property_type, COUNT(*) n, ROUND(AVG(price_num)) avg_price,
ROUND(AVG(bedrooms),2) avg_bed, ROUND(AVG(bathrooms),2) avg_bath,
ROUND(AVG(parking_spaces),2) avg_park, ROUND(AVG(land_size_m2)) avg_land
FROM RealEstateAU_NT_clean GROUP BY property_type ORDER BY n DESC;

-- NT: Price by bedrooms
SELECT bedrooms, COUNT(*) n, ROUND(AVG(price_num)) avg_price,
MIN(price_num) mn, MAX(price_num) mx
FROM RealEstateAU_NT_clean
WHERE price_num IS NOT NULL AND bedrooms IS NOT NULL
GROUP BY bedrooms;

-- NT: Top suburbs
SELECT suburb, COUNT(*) n, ROUND(AVG(price_num)) avg_price
FROM RealEstateAU_NT_clean
GROUP BY suburb HAVING n >= 15 ORDER BY avg_price DESC;

-- NT: Price type
SELECT price_type, COUNT(*) n, COUNT(price_num) with_price
FROM RealEstateAU_NT_clean GROUP BY price_type;

-- NT: Price by bathrooms
SELECT bathrooms, COUNT(*) n, ROUND(AVG(price_num)) avg_price
FROM RealEstateAU_NT_clean
WHERE price_num IS NOT NULL GROUP BY bathrooms;

-- MELB: Property type
SELECT Type, COUNT(*) n, ROUND(AVG(Price)) avg_price,
ROUND(AVG(Rooms),2) rooms, ROUND(AVG(Bathroom),2) bath,
ROUND(AVG(Car),2) car, ROUND(AVG(Landsize)) land,
ROUND(AVG(Distance),1) dist
FROM melb_data_clean GROUP BY Type;

-- MELB: Price by rooms
SELECT Rooms, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Rooms;

-- MELB: Price by bathrooms
SELECT Bathroom, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Bathroom;

-- MELB: Price by distance
SELECT CASE
WHEN Distance < 5 THEN '0-5'
WHEN Distance < 10 THEN '5-10'
WHEN Distance < 15 THEN '10-15'
WHEN Distance < 20 THEN '15-20'
WHEN Distance < 30 THEN '20-30'
ELSE '30+' END band,
COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean
GROUP BY band ORDER BY MIN(Distance);

-- MELB: Region
SELECT Regionname, COUNT(*) n, ROUND(AVG(Price)) avg_price,
ROUND(AVG(Distance),1) dist
FROM melb_data_clean
GROUP BY Regionname ORDER BY avg_price DESC;

-- MELB: Price by decade
SELECT (CAST(YearBuilt AS INT)/10)*10 decade,
COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean
WHERE YearBuilt >= 1850 GROUP BY decade;

-- MELB: Sale method
SELECT Method, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Method;

-- MELB: Price by car spaces
SELECT Car, COUNT(*) n, ROUND(AVG(Price)) avg_price
FROM melb_data_clean GROUP BY Car; 