import csv
import pandas as pd
import os
import random as r

from pandas.core.algorithms import unique

# change directory
os.chdir('3309/KLOAP-3309/src')

# get sample male names
names = pd.read_csv('athlete_events.csv', usecols=[1, 2])
namesList = names['Name']
gender = names['Sex']
namesList = namesList.tolist()
gender = gender.tolist()
mensNames = []

for i in range(len(gender)):
    if (gender[i]=='M'):
        mensNames.append(namesList[i])

# get only unique names
uniqueMensNames = []
i = 0
while (i < len(mensNames)):
    if (mensNames[i] not in uniqueMensNames):
        uniqueMensNames.append(mensNames[i])
        i += 50
    else:
        continue

# list to hold rows
rows = []
# positions list
positions = ['Point Guard', 'Shooting Guard', 'Small Forward', 'Power Forward', 'Center']
# make teams and respective conferences lists
os.chdir('outputs')
teamNames = []
conferences = []
with open('Teams.csv') as teams:
    reader = csv.reader(teams, delimiter=",")
    for row in reader:
        teamNames.append(row[2])
        conferences.append(row[1])


for i in range(len(uniqueMensNames)):
    temp = []
    temp.append(i+1)
    # randomize age
    temp.append(r.randint(18, 22))
    # randomize height (cm)
    temp.append(r.randint(180, 220))
    # randomize weight (kg)
    temp.append(r.randint(80, 140))
    # add name
    temp.append(uniqueMensNames[i])
    # add position
    temp.append(positions[r.randint(0, 4)])
    # add team name + conference
    tempInt = r.randint(0, len(teamNames)-1)
    temp.append(teamNames[tempInt])
    temp.append(conferences[tempInt])
    rows.append(temp)

# write list to .csv
with open('Athletes.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(rows)