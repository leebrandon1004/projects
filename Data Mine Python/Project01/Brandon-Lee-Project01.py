#Question 1
print(7+10)
# This adds 7 and 10 which results in 17

#Question 2
#Learned how to store data into lists
my_list = [1, 2, 3]
my_list
print(f'My list is: {my_list}')

#Part 1
x = 6
y = 8
z = x * y
print(z)

#Part 2
x = z = y = 'peanutbutter'

#Part 3
# Learned how to make a club sandwich from the site: https://en.wikipedia.org/wiki/Club_sandwich
club_sandwich = ['tomato', 'lettuce', 'bread', 'turkey', 'bacon', 'mayonnaise']

#Question 3
# There are two cell tpes: Code and Markdown cells

#Question 4
#Import data set
import pandas as pd
disney= pd.read_csv("/anvil/projects/tdm/data/disney/flight_of_passage.csv")

#Number of rows in the data set
len(disney)

#Number of columns in the data set
len(disney.columns)

#Beginning of the data set
disney.head()

#Last of the data set
disney.tail()
