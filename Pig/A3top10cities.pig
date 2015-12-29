--##### A3. Find top 10 cities by sales #####

--Load data
A = LOAD '~/txns1.txt' using PigStorage(',') as (txnid:chararray, date:chararray, custid:chararray, amount:double, category:chararray, product:chararray, city:chararray, state:chararray, type:chararray);

--Group data by cities
B = group A by city;

--Obtain citywise sales
C = foreach B generate group, SUM(A.amount) as citysales;

--Sort sales in descending order
D = order C by $1 Desc;

--Filter top-10 cities
E = limit D 10;
dump E;

--##### Output #####

--$ pig -x local A3top10cities.pig

--(Pasadena,95533.97999999991)
--(Columbia,93853.1100000001)
--(Kansas City,92750.95999999996)
--(Columbus,90586.10000000006)
--(Long Beach,52686.69999999998)
--(Cincinnati,52008.210000000014)
--(Buffalo,50933.81999999998)
--(Detroit,50878.03999999999)
--(Boston,50532.34999999998)
--(Oakland,49764.81000000003)



