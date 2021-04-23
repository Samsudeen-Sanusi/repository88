# repository88
#data can be obtained from https://gist.github.com/bobbae/b4eec5b5cb0263e7e3e63a6806d045f2

#import library
import os
import pandas as pd
import numpy as np

#read file 
raw = pd.read_csv('data.csv')

#print rows and columns in data
print(raw)

       Year  Rank  ... Revenue (in millions)  Profit (in millions)
0      1955     1  ...                9823.5                 806.0
1      1955     2  ...                5661.4                 584.8
2      1955     3  ...                3250.4                 195.4
3      1955     4  ...                2959.1                 212.6
4      1955     5  ...                2510.8                  19.1
...     ...   ...  ...                   ...                   ...
25495  2005   496  ...                3648.6                 493.0
25496  2005   497  ...                3631.6                 175.4
25497  2005   498  ...                3630.4                  57.8
25498  2005   499  ...                3616.6                  70.6
25499  2005   500  ...                3614.0                 584.0

[25500 rows x 5 columns]

#rows in raw
len(raw)   #25500

#convert data type object in Profit to float
raw["Profit (in millions)"] = pd.to_numeric(raw['Profit (in millions)'], errors='coerce')

#confirm data type
raw.info()

RangeIndex: 25500 entries, 0 to 25499
Data columns (total 5 columns):
Year                     25500 non-null int64
Rank                     25500 non-null int64
Company                  25500 non-null object
Revenue (in millions)    25500 non-null float64
Profit (in millions)     25131 non-null float64
dtypes: float64(2), int64(2), object(1)
memory usage: 996.2+ KB

#remove N.A. values in profit column
data = raw.dropna(subset=['Profit (in millions)'])

#view data
data

       Year  Rank  ... Revenue (in millions)  Profit (in millions)
0      1955     1  ...                9823.5                 806.0
1      1955     2  ...                5661.4                 584.8
2      1955     3  ...                3250.4                 195.4
3      1955     4  ...                2959.1                 212.6
4      1955     5  ...                2510.8                  19.1
...     ...   ...  ...                   ...                   ...
25495  2005   496  ...                3648.6                 493.0
25496  2005   497  ...                3631.6                 175.4
25497  2005   498  ...                3630.4                  57.8
25498  2005   499  ...                3616.6                  70.6
25499  2005   500  ...                3614.0                 584.0

[25131 rows x 5 columns]

#no of rows in data
len(data)    #25131


#PART 2
#convert dataframe to dictionary
data_dict = data.to_dict()

#write to JSON
with open('data2.json', 'w') as outfile:
     json.dump(data_dict, outfile)

#sort data
sorted_data = data.sort_values('Profit (in millions)', ascending=False)

#top 20 rows with highest profit value
print(sorted_data.head(n=20))

       Year  Rank  ... Revenue (in millions)  Profit (in millions)
25001  2005     2  ...              270772.0               25330.0
22001  1999     2  ...              144416.0               22071.0
24501  2004     2  ...              213199.0               21510.0
24507  2004     8  ...               94713.0               17853.0
23000  2001     1  ...              210392.0               17720.0
25007  2005     8  ...              108276.0               17046.0
25004  2005     5  ...              152363.0               16593.0
23501  2002     2  ...              191581.0               15320.0
24005  2003     6  ...              100789.0               15276.0
24504  2004     5  ...              134187.0               15002.0
25017  2005    18  ...               63324.0               14143.0
23506  2002     7  ...              112022.0               14126.0
24004  2003     5  ...              131698.0               14118.0
23505  2002     6  ...              125913.0               13684.0
23005  2001     6  ...              111826.0               13519.0
25005  2005     6  ...              147967.0               13328.0
23004  2001     5  ...              129853.0               12735.0
23009  2001    10  ...               64707.0               11797.0
24002  2003     3  ...              182466.0               11460.0
25023  2005    24  ...               52921.0               11361.0

[20 rows x 5 columns]

#Part 3
len(raw) #25500, first print result

len(data) #25131, second print result

print(sorted_data.head(n=20)), #third print result

