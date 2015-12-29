--##### A4. Find top 10 categories by sales

--Load data
A = LOAD '~/txns1.txt' using PigStorage(',') as (txnid:chararray, date:chararray, custid:chararray, amount:double, category:chararray, product:chararray, city:chararray, state:chararray, type:chararray);

--Group data by categories
B = group A by category;

--Compute category-wise sales
C = foreach B generate group, SUM(A.amount) as catsales;

--Sort sales in descending order
D = order C by $1 desc;

--Filter top-10 categories
E = limit D 10;
dump E;

--##### Output #####

--$ pig -x local A4top10cats.pig

--(Outdoor Recreation,846678.6399999982)
--(Exercise & Fitness,766463.8699999977)
--(Team Sports,617461.3799999998)
--(Water Sports,531815.9700000004)
--(Games,374932.69999999966)
--(Gymnastics,327225.3399999993)
--(Winter Sports,321973.56000000023)
--(Outdoor Play Equipment,294728.28000000014)
--(Indoor Games,288506.0399999996)
--(Jumping,205842.67000000013)
