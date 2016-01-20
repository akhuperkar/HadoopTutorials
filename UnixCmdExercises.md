## Unix command exercises

#1. show last 5 lines of a file
bigdata@bigdata:~$ tail -5 birdstrikes.csv

#2. redirect fist 100 lines of a file into a separate file
bigdata@bigdata:~$ head -100 birdstrikes.csv > first100.csv

#3. How to display the 3rd line of the file
bigdata@bigdata:~$ head -3 birdstrikes.csv > first3.csv
bigdata@bigdata:~$ tail -1 first3.csv
3,Airplane,2000-01-01,No damage,UNITED AIRLINES,,,,Medium,0,

#4. pipe operator - output of first command is fed into the second 
bigdata@bigdata:~$ head -3 birdstrikes.csv | tail -1 > 3rdline.csv
bigdata@bigdata:~$ cat 3rdline.csv 
3,Airplane,2000-01-01,No damage,UNITED AIRLINES,,,,Medium,0,

bigdata@bigdata:~$ cat birdstrikes.csv | head -3
id,aircraft,flight_date,damage,airline,state,phase_of_flight,reported_date,bird_size,cost,feet_above_ground
2,Airplane,2000-01-01,No damage,CONTINENTAL AIRLINES,New Jersey,Take-off run,,Medium,0,0
3,Airplane,2000-01-01,No damage,UNITED AIRLINES,,,,Medium,0,

# put the 4th and 5th line of csv into 45.csv
bigdata@bigdata:~$ head -5 birdstrikes.csv | tail -2 > 45.csv
bigdata@bigdata:~$ cat 45.csv 
4,Airplane,2000-01-01,No damage,UNITED AIRLINES,Colorado,Climb,,Medium,0,
5,Airplane,2000-01-01,No damage,UNITED AIRLINES,Illinois,Approach,,Medium,0,

# filter data for California
bigdata@bigdata:~$ grep California birdstrikes.csv > california.csv
bigdata@bigdata:~$ head -2 california.csv 
11,Airplane,2000-01-02,No damage,UNITED AIRLINES,California,Take-off run,,Small,0,0
23,Airplane,2000-01-04,No damage,AMERICAN AIRLINES,California,Climb,,Large,26727,100

# filter data for United Airlines in California 
bigdata@bigdata:~$ cat birdstrikes.csv | grep California | grep 'UNITED AIRLINES'

# bigdata@bigdata:~$ grep -c California birdstrikes.csv
7803

# without case sensivity use -i
bigdata@bigdata:~$ grep -i california birdstrikes.csv | head -10
11,Airplane,2000-01-02,No damage,UNITED AIRLINES,California,Take-off run,,Small,0,0
23,Airplane,2000-01-04,No damage,AMERICAN AIRLINES,California,Climb,,Large,26727,100
31,Airplane,2000-01-05,No damage,NORTHWEST AIRLINES,California,Take-off run,,Medium,0,0
40,Airplane,2000-01-06,No damage,AMERICA WEST AIRLINES,California,Approach,2000-01-06,Small,0,
50,Airplane,2000-01-08,No damage,UNITED AIRLINES,California,Take-off run,,Medium,0,0
55,Airplane,2000-01-08,No damage,AMERICA WEST AIRLINES,California,Approach,2000-01-08,Small,0,200
64,Airplane,2000-01-09,Caused damage,BUSINESS,California,Approach,,,0,500
80,Airplane,2000-01-11,No damage,UNITED AIRLINES,California,Approach,,Medium,0,
82,Airplane,2000-01-11,Caused damage,BUSINESS,California,Landing Roll,,,0,0
95,Airplane,2000-01-12,No damage,BUSINESS,California,Approach,,,0,

# display the first 3 lines of incidents that were caused to Helicopters and tha happened outside Colorado
bigdata@bigdata:~$ cat birdstrikes.csv | grep -i colorado | grep -i helicopter | head -3
4371,Helicopter,2000-09-15,No damage,MILITARY,Colorado,Approach,2001-01-19,Small,0,50
10333,Helicopter,2001-08-18,No damage,BUSINESS,Colorado,En Route,2001-08-19,,0,2000
13915,Helicopter,2002-04-27,Caused damage,BUSINESS,Colorado,En Route,,,0,

bigdata@bigdata:~$ cat birdstrikes.csv | grep Helicopter | grep -v Colorado | head -3
28,Helicopter,2000-01-04,No damage,PHI INC,,Approach,2000-01-04,,0,100
115,Helicopter,2000-01-14,Caused damage,BUSINESS,California,Approach,2000-01-15,,1438,800
341,Helicopter,2000-02-17,Caused damage,BUSINESS,Alabama,Approach,2000-02-17,,67,500

# SELECT * FROM birdstrikes WHERE 

bigdata@bigdata:~$ wc birdstrikes.csv 
  99405  307242 7598090 birdstrikes.csv
characters words lines
bigdata@bigdata:~$ wc -l birdstrikes.csv 
99405 birdstrikes.csv
bigdata@bigdata:~$ cat birdstrikes.csv | wc -l
99405

bigdata@bigdata:~$ head -5 birdstrikes.csv | wc -m
409

# display only specified columns of a file
bigdata@bigdata:~$ head -10 birdstrikes.csv | cut -d , -f 1,2,3
id,aircraft,flight_date
2,Airplane,2000-01-01
3,Airplane,2000-01-01
4,Airplane,2000-01-01
5,Airplane,2000-01-01
7,Airplane,2000-01-01
8,Airplane,2000-01-01
9,Airplane,2000-01-02
10,Airplane,2000-01-02
11,Airplane,2000-01-02

bigdata@bigdata:~$ head -10 birdstrikes.csv | cut -d , -f 5,6
airline,state
CONTINENTAL AIRLINES,New Jersey
UNITED AIRLINES,
UNITED AIRLINES,Colorado
UNITED AIRLINES,Illinois
US CUSTOMS AND BORDER PROTECTION,Florida
AMERICAN AIRLINES,
BUSINESS,Ohio
BUSINESS,Florida
UNITED AIRLINES,California

bigdata@bigdata:~$ head -10 birdstrikes.csv | cut -d , -f 5
airline
CONTINENTAL AIRLINES
UNITED AIRLINES
UNITED AIRLINES
UNITED AIRLINES
US CUSTOMS AND BORDER PROTECTION
AMERICAN AIRLINES
BUSINESS
BUSINESS
UNITED AIRLINES

# get the state and the bird size of the airplane accidents (head -5)
bigdata@bigdata:~$ cat birdstrikes.csv | grep Airplane | cut -d , -f 6,9 | head -5 
New Jersey,Medium
,Medium
Colorado,Medium
Illinois,Medium
Florida,Large

# sorting
bigdata@bigdata:~$ echo -e "9\n10" | sort
10
9
bigdata@bigdata:~$ echo -e "9\n10" | sort -n
9
10

bigdata@bigdata:~$ head -5 birdstrikes.csv | sort
2,Airplane,2000-01-01,No damage,CONTINENTAL AIRLINES,New Jersey,Take-off run,,Medium,0,0
3,Airplane,2000-01-01,No damage,UNITED AIRLINES,,,,Medium,0,
4,Airplane,2000-01-01,No damage,UNITED AIRLINES,Colorado,Climb,,Medium,0,
5,Airplane,2000-01-01,No damage,UNITED AIRLINES,Illinois,Approach,,Medium,0,
id,aircraft,flight_date,damage,airline,state,phase_of_flight,reported_date,bird_size,cost,feet_above_ground

bigdata@bigdata:~$ head -5 birdstrikes.csv | sed 1d
2,Airplane,2000-01-01,No damage,CONTINENTAL AIRLINES,New Jersey,Take-off run,,Medium,0,0
3,Airplane,2000-01-01,No damage,UNITED AIRLINES,,,,Medium,0,
4,Airplane,2000-01-01,No damage,UNITED AIRLINES,Colorado,Climb,,Medium,0,
5,Airplane,2000-01-01,No damage,UNITED AIRLINES,Illinois,Approach,,Medium,0,

bigdata@bigdata:~$ cat birdstrikes.csv | sed 1d | sort -n -t , -k 10 | tail
89820,Airplane,2011-03-15,Caused damage,FEDEX EXPRESS,Oklahoma,Climb,,Medium,5871028,25
19229,Airplane,2002-12-03,Caused damage,BUSINESS,Oregon,Take-off run,,Large,6338699,0
37528,Airplane,2005-08-01,Caused damage,GOVERNMENT,,Climb,2005-08-11,,7613776,500
41236,Airplane,2005-11-29,Caused damage,FEDEX EXPRESS,Nebraska,Climb,,Large,8566091,5000
57817,Airplane,2007-11-22,Caused damage,DELTA AIR LINES,,Climb,,Medium,10135286,250
6085,Airplane,2000-11-26,Caused damage,UNITED AIRLINES,California,Climb,,Medium,10958209,1000
36543,Airplane,2005-06-24,Caused damage,FEDEX EXPRESS,,Take-off run,,Medium,11076287,0
6528,Airplane,2001-01-14,Caused damage,BUSINESS,Alabama,Landing Roll,,Large,12397751,0
67578,Airplane,2009-02-03,Caused damage,UNITED AIRLINES,Colorado,Climb,,Large,14757868,2100
67386,Airplane,2009-01-15,Caused damage,US AIRWAYS,New York,Climb,,Large,37948803,2900

bigdata@bigdata:~$ cat birdstrikes.csv | sed 1d | sort -n -t , -k 10 -r | head
67386,Airplane,2009-01-15,Caused damage,US AIRWAYS,New York,Climb,,Large,37948803,2900
67578,Airplane,2009-02-03,Caused damage,UNITED AIRLINES,Colorado,Climb,,Large,14757868,2100
6528,Airplane,2001-01-14,Caused damage,BUSINESS,Alabama,Landing Roll,,Large,12397751,0
36543,Airplane,2005-06-24,Caused damage,FEDEX EXPRESS,,Take-off run,,Medium,11076287,0
6085,Airplane,2000-11-26,Caused damage,UNITED AIRLINES,California,Climb,,Medium,10958209,1000
57817,Airplane,2007-11-22,Caused damage,DELTA AIR LINES,,Climb,,Medium,10135286,250
41236,Airplane,2005-11-29,Caused damage,FEDEX EXPRESS,Nebraska,Climb,,Large,8566091,5000
37528,Airplane,2005-08-01,Caused damage,GOVERNMENT,,Climb,2005-08-11,,7613776,500
19229,Airplane,2002-12-03,Caused damage,BUSINESS,Oregon,Take-off run,,Large,6338699,0
89820,Airplane,2011-03-15,Caused damage,FEDEX EXPRESS,Oklahoma,Climb,,Medium,5871028,25

## Use bigdata@bigdata:~$ cat birdstrikes.csv | sed 1d | sort -n -t , -k 10 -r
#1. which is the most expensive incident
bigdata@bigdata:~$ cat birdstrikes.csv | sed 1d | sort -n -t , -k 10 -r | head -1
67386,Airplane,2009-01-15,Caused damage,US AIRWAYS,New York,Climb,,Large,37948803,2900

#2. which is the most expensive incident but display only the cost
bigdata@bigdata:~$ cat birdstrikes.csv | sed 1d | sort -n -t , -k 10 -r | head -1 | cut -d , -f 10
37948803

#3. which is the 2nd most expensive incident caused to Helicopters
bigdata@bigdata:~$ cat birdstrikes.csv | sed 1d | sort -n -t , -k 10 -r | grep Helicopter | head -2
41589,Helicopter,2005-12-30,Caused damage,BUSINESS,Louisiana,En Route,,,1757025,500
89047,Helicopter,2011-01-09,Caused damage,BUSINESS,,Climb,,Medium,1500000,150


















