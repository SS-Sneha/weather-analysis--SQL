select * from `weather analysis file`;

-- Finding all the unique 'wind speed' values
select distinct `Wind Speed_km/h` from `weather analysis file`;

-- Renaming the column name 'Weather' to 'Weather_Condition' 
alter table `weather analysis file`
rename COLUMN Weather to Weather_Condition;

-- Renaming the column name
alter table`weather analysis file`
rename column `Rel Hum_%` to Relative_humidity;
alter table`weather analysis file`
rename column Press_kPa to Pressure;

-- finding the number of times when the 'weather is exactly clear' 
SELECT COUNT(*) FROM `weather analysis file`
WHERE Weather_Condition = "Clear";

-- finding the number of times when the 'weather is exactly 4km/h' 
SELECT COUNT(*) FROM `weather analysis file`
WHERE Weather_Condition = 4;

-- finding the null value in the data
select Weather_Condition,Visibility_km,Pressure,`Wind Speed_km/h`,Relative_humidity,`Dew Point Temp_C`,Temp_C
from `weather analysis file`
where  Weather_Condition IS NULL 
OR Visibility_km IS NULL 
OR Pressure IS NULL 
OR `Wind Speed_km/h`IS NULL 
OR Relative_humidity IS NULL 
OR `Dew Point Temp_C`IS NULL 
OR Temp_C IS NULL;

-- What is mean visibility
SELECT AVG(visibility) as mean_visibility
FROM `weather analysis file`;

-- what is standard deviation of pressure
SELECT stddev_pop(Pressure)
AS STANDARD_DEVIATION_PRESSURE 
FROM `weather analysis file`;

-- What is the variance of 'relative humidity' in this data?
SELECT variance(Relative_humidity) 
AS Variance_relative_humidity
FROM `weather analysis file`;

-- Find all the instances when 'snow was recorded'
SELECT * FROM  `weather analysis file`
WHERE "Weather_Condition" = "snow";

-- finding all the instance where 'wind speed is above 24' and 'visibility is 25'
SELECT * FROM  `weather analysis file`
WHERE `Wind Speed_km/h` >24 AND Visibility_km = 25;

-- find mean value in each column against each 'weather condition'
SELECT Weather_Condition, avg(`Wind Speed_km/h`) AS Mean_wind_speed, avg(Visibility_km) AS Mean_visibility,
avg(Pressure) AS Mean_pressure, avg(Relative_humidity) AS Mean_relative_humidity
FROM  `weather analysis file`
GROUP BY Weather_Condition;

-- Minimum and Maximum value of each column against each 'weather condition'
SELECT Weather_Condition,
MIN(`Wind Speed_km/h`) AS Min_wind_speed, MAX(`Wind Speed_km/h`) AS Max_wind_speed,
MIN(`Visibility_km`) AS Mean_visibility, MAX(Visibility_km) AS Max_visibility,
MIN(Pressure) AS Min_Pressure, MAX(Pressure) AS Max_Pressure,
MIN(Relative_humidity) AS Min_relative_humidity, MAX(Relative_humidity) AS Max_relative_humidity
FROM `weather analysis file`
GROUP BY Weather_Condition;

-- show all the record where weather condition if fog'
SELECT * FROM `weather analysis file` 
WHERE Weather_Condition = 'FOG';

-- show all the record where weather is clear
SELECT * FROM `weather analysis file`
WHERE Weather_Condition = 'Clear';

-- find all instance when weather is 'clear' and 'relative humidity is greater than 50' 
SELECT * FROM `weather analysis file`
WHERE Weather_Condition = 'CLEAR'
AND Relative_humidity >50;

-- show when 'visibility is above 40'
SELECT * FROM `weather analysis file`
WHERE Visibility_km >40;

