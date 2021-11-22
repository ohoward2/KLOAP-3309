import csv
import pandas as pd
import os

# change directory
os.chdir('3309/KLOAP-3309/src')
# generate list of American cities used for building Teams.csv
cityList = pd.read_csv('uscities.csv', usecols=[1])
cityList = cityList['city_ascii'].tolist()

finalCities = []

# have a list of added city names to remove duplicate city names
addedCityNames = []

# put all US tuples in a list
for i in range(len(cityList)):
    if (cityList[i] not in addedCityNames):
        temp = []
        temp.append(i+1)
        temp.append(cityList[i])
        temp.append('United States')
        finalCities.append(temp)
        addedCityNames.append(cityList[i])

os.chdir('outputs')
# write list to .csv
with open('Cities.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(finalCities)