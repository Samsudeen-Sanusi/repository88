import os
os.chdir('/Users/samsudeensanusi/Desktop/SADA/')
os.getcwd()

import pandas as pd
import numpy as np
raw = pd.read_csv('data.csv')

#print rows and columns in data
print(raw)

#25500 row and 5 columns

#rows in raw
len(raw)   #25500

#convert data type object in Profit to float
raw["Profit (in millions)"] = pd.to_numeric(raw['Profit (in millions)'], errors='coerce')

#confirm data type
raw.info()

#remove N.A. values
data = raw.dropna(subset=['Profit (in millions)'])

#no of rows in data
len(data)    #25131


#PART 2
#data to dict
data_dict = data.to_dict()

#write to JSON
with open('data2.json', 'w') as outfile:
     json.dump(data_dict, outfile)

#sort data
sorted_data = data.sort_values('Profit (in millions)', ascending=False)

#top 20 rows with highest profit value
print(sorted_data.head(n=20))


#Part 3
len(raw) #25500, first print

len(data) #25131, second print

print(sorted_data.head(n=20)), #third print 








