--CREATE TABLE--

CREATE TABLE uber (
    Pickup_Location VARCHAR(100) NOT NULL,
    Dropoff_Location VARCHAR(100) NOT NULL,
    Cab_Type VARCHAR(50) NOT NULL,
    Distance_km DECIMAL(5, 2) NOT NULL,
    Fare_INR DECIMAL(10, 2) NOT NULL,
    Payment_Method VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL
);

SELECT * FROM uber;

--SQL BUSINESS QUESTIONS--

--Q1. How much total revenue was generated from all ride?--
SELECT SUM(Fare_INR) AS Total_Revenue FROM uber;

--Q2. Which pickup location had the highest number of rides?--
SELECT Pickup_Location, COUNT(*) AS Ride_Count
FROM uber
GROUP BY Pickup_Location
ORDER BY Ride_Count DESC;

--Q3. Which cab type was used the most by customers?--
SELECT Cab_Type, COUNT(*) AS Usage_Count
FROM uber
GROUP BY Cab_Type
ORDER BY Usage_Count DESC

--Q4. How much revenue was generated by each cab type?--
SELECT Cab_type, SUM(Fare_INR) AS Revenue
FROM uber
GROUP BY Cab_Type
ORDER BY Revenue DESC;

--Q5. Which payment method is the most popular among customers?--
SELECT Payment_Method, COUNT(*) AS Count
FROM uber
GROUP BY Payment_Method
ORDER BY Count DESC;

--Q6. At what time of day do most rides occur?--
SELECT EXTRACT(HOUR FROM Time) AS Hour, COUNT(*) AS Ride_Count
FROM uber
GROUP BY Hour
ORDER BY Ride_Count DESC;

--Q7.What is the average distance traveled per ride?--
SELECT AVG(Distance_km) AS Avg_Distance
FROM uber;

--Q8.How does revenue trend across different months?--
SELECT EXTRACT(MONTH FROM Date) AS Month, SUM(Fare_INR) AS Monthly_Revenue
FROM uber
GROUP BY Month
ORDER BY Monthly_Revenue DESC;

--Q9.Which route are most frequently traveled?--
SELECT Pickup_Location, Dropoff_Location, COUNT(*) AS Route_Count
FROM uber
GROUP BY Pickup_Location, Dropoff_Location
ORDER BY Route_Count DESC;

--Q10. On which day of the week are most rides taken?--
SELECT TO_CHAR(Date, 'Day') AS Day, COUNT(*) AS Ride_Count
FROM uber
GROUP BY Day
ORDER BY Ride_Count DESC;
