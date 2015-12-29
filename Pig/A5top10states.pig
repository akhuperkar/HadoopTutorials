--##### A5. Find top 10 states by sales #####

--Load data
A = LOAD '~/txns1.txt' using PigStorage(',') as (txnid:chararray, date:chararray, custid:chararray, amount:double, category:chararray, product:chararray, city:chararray, state:chararray, type:chararray);

--Group data by states
B = group A by state;

--Compute statewise sales
C = foreach B generate group, SUM(A.amount) as statesales;

--Sort sales in descending order
D = order C by $1 desc;

--Filter top-10 states
E = limit D 10;
dump E;

--##### Output #####

--$ pig -x local A5top10states.pig

--(California,702346.2300000016)
--(Texas,541267.2400000005)
--(Florida,274858.9500000001)
--(Ohio,188613.8700000003)
--(Oregon,187052.05000000034)
--(Washington,181508.8700000001)
--(Colorado,178299.69999999975)
--(Tennessee,177685.79000000018)
--(Virginia,144447.26000000015)
--(Massachusetts,143744.66000000003)

