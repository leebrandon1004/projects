#Question 1
#Part a 
#Data given
data = {
    'shoes':['red', 'purple', 'red', 'purple', 'red', 'red', 'red'],
    'hats': ['blue', 'blue', 'blue', 'white', 'white', 'blue', 'blue']
}
#Result of data
print(data)
#Import pandas for DataFrame
import pandas as pd
#Part b and c
store = pd.DataFrame(data,index=['Jay', 'Mary',' Bill', 'Chris', 'Martha', 'Karen', 'Rob'])
#Result of store
print(store)

#Question 2
#Import dataset
myDF = pd.read_csv("/anvil/projects/tdm/data/death_records/DeathRecords.csv")
#Part a 
#11th row of data
myDF.iloc[10,]
#Part b
#Last 5 rows
myDF.tail()
#Part c
#Number of columns and rows
myDF.shape
#Part d
#Column names
myDF.columns

#Question 3
#Part a 
#Number of people above age 52
len(myDF['Age'][myDF['Age']>52])
#Part b
#Number of males vs females
myDF['Sex'].value_counts()
#Part c
#Number of females above 70
len(myDF['Age'][(myDF['Age']>70) & (myDF['Sex'] == 'F')])

#Question 4
#Import package
import matplotlib.pyplot as plt
#Part a 
#Number of people with different MaritalStatus
mydata = myDF['MaritalStatus'].value_counts()
#Bar plot of data
plt.bar(mydata.index,mydata)
#Part  b
#Age of people at their death
mydata = myDF['Age'][myDF['Age']<999].value_counts()
#Bar plot of data
plt.bar(mydata.index,mydata)

#Question 5
#Number of people with different months of death
mydata = myDF['MonthOfDeath'].value_counts()
#Bar plot of data
plt.bar(mydata.index,mydata)