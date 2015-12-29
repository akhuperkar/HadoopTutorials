--#### A1. Find total sales ####

--Load data
txn = LOAD '~/txns1.txt' using PigStorage(',') as (txnid:chararray, date:chararray, custid:chararray, amount:double, category:chararray, product:chararray, city:chararray, state:chararray, type:chararray);

--Group dataset
total = group txn ALL;

--Total sales
totalsales = foreach total generate group, SUM(txn.amount);
dump totalsales;

--#### Output ####

--$ pig -x local A1totalsales.pig

--(all,5110820.540000036)

