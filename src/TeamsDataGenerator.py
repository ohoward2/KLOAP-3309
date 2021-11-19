import csv
import pandas as pd
import os
import random as r

# lists to hold team names and cities
teamNames = []
teamCities = []
# locate and read info from inputted csv files
os.chdir('3309/KLOAP-3309/src')
cityList = pd.read_csv('uscities.csv', usecols=[1])
with open('MTeams.csv') as teams:
    reader = csv.reader(teams, delimiter=",")
    for row in reader:
        teamNames.append(row[1])
# remove header
teamNames = teamNames[1:]
# make dataframe into lost
cityList = cityList['city_ascii'].tolist()

rows = []

ranks = []

conferences = ['ACC', 'Atlantic Coast', 'PAC-12', 'BIG 12', 'BIG 10', 'SEC', 'Conference USA', 'FBS', 'Mid-American', 'Mountain West', 'Sun Belt']

# put all possible team rankings
for i in range(1, len(teamNames)+1):
    ranks.append(i)

# create rows
for i in range(len(teamNames)):
    temp = []
    # add ranking
    randRank = r.randint(0, len(ranks)-1)
    temp.append(ranks[randRank])
    ranks.remove(ranks[randRank])
    # add conference
    temp.append(conferences[r.randint(0, len(conferences)-1)])
    # add team name
    temp.append(teamNames[i])
    # add a random cityID
    temp.append(r.randint(1, len(cityList)))
    rows.append(temp)

# create output csv and write all the rows
os.chdir('outputs')

with open('Teams.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(rows)