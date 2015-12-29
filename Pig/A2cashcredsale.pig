--##### A2. Find Cash sales, Credit sales, and % of total #####

--Load data 
A = LOAD '~/txns1.txt' using PigStorage(',') as (txnid:chararray, date:chararray, custid:chararray, amount:double, category:chararray, product:chararray, city:chararray, state:chararray, type:chararray);

--Obtain total sales
B = group A ALL;
C = foreach B generate SUM(A.amount) as totalsales;

--Obtain sales by transaction type
D = GROUP A by type;
E = FOREACH D GENERATE group, SUM(A.amount) as totaltypesales;

--Compute percentage of total
F = foreach E Generate group, $1, ($1/C.totalsales*100);
dump F;

--##### Output ###### 

--$ pig -x local A2cashcredsale.pig

--(cash,187685.6100000006,3.672318535371607)
--(credit,4923134.929999994,96.32768146462757)

