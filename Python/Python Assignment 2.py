'''List (Creation, Modification and Access):
1. List Creation:
 '''
print("---------------1. List Creation:-----------------\n")
#a. Create a list named age_list with five integer elements. For eg., [24, 25, 26, 27, 28]
age_list=[24, 25, 26, 27, 28]

#b. Create a list named name_list with five string elements.
name_list=["Thanvhik", "Lavanya", "Mohi", "Manoj", "Manimegalai"]
print(f"List Creation named age_list : {age_list}\n")
print(f"List Creation named age_list : {name_list}\n")

print("---------------2. List Operations / Modifications:-----------------\n")
'''2. List Operations / Modifications: '''
#a. Append the string "Yazhini" to name_list.
name_list.append('Yazhini')
print(f"Name list after Appending the string 'Yazhini' : {name_list}\n")

#b. Insert the element 30 at index 2 in age_list.
age_list[2]=30
print(f"Age list after inserting element 30 at index 2 : {age_list}\n")

#c. Remove the string "Yazhini" from name_list.
name_list.remove("Yazhini")
print(f"Name list after Removing the string 'Yazhini' : {name_list}\n")

#d. Pop the last element from age_list.
age_list.pop()
print(f"Age list after Poping last element : {age_list}\n")

#e. Extend the age_list with additional ages [29, 30, 26].
age_list.extend([29, 30, 26])
print(f"Age list after extending additional ages [29, 30, 26] : {age_list}\n")

#f. Sort age_list in descending order.
age_list.sort()
age_list.reverse()
print(f"Age list after sorting in descending order : {age_list}\n")

#g. Find Max age, Min age and sum of all ages from age_list.
print(f"Maximum age from Age list : {max(age_list)}\n")
print(f"Minimum age from Age list : {min(age_list)}\n")
print(f"Sum of ages from Age list : {sum(age_list)}\n")

'''3. Accessing List Elements: '''
print("---------------3. Accessing List Elements: -----------------\n")
#a. Print the first element of name_list.
print(f"First element of name_list : {name_list[0]}\n")

#b. Print the last element of name_list.
print(f"Last element of name_list : {name_list[-1]}\n")

#c. Print the elements from index 2 to index 4 in name_list.
print(f"Elements from index 2 to index 4 in name_list : {name_list[2:5:]}\n")

#d. Print the elements of name_list in reverse order.
print(f"Elements of name_list in reverse order : {name_list[-1::-1]}\n")

'''Dictionary (Creation, Modification and Access):  '''
print("---------------Dictionary (Creation, Modification and Access): -----------------\n")
#a. Create a dictionary named student_marks that maps the names of five students to their marks (use scale of from 0 to 100).
student_marks={"Mohan":89,"Lavanya":90,"Thanvhik":99,"Lakshmi":78,"Manoj":65}

#b. Access and print the mark of a specific student, of your choice.
print(f"Printing the marks of Mohan : {student_marks.get("Mohan", 'Student N/A')}\n")

#c. Add a new student "Janani" with a mark of 80 to the student_marks dictionary.
student_marks["Janani"]=80
print(f"After adding new student Janani : {student_marks}\n")

#d. Update the mark of any one older student to 82.
print(f"Dictionary before updating mark of Lakshmi : {student_marks}\n")
student_marks["Lakshmi"]=87
print(f"Dictionary After updating mark of Lakshmi : {student_marks}\n")
#e. Use the keys(), values(), and items() methods to print all keys, values, and key-value pairs in the student_marks dictionary.
print(f"Keys in the student_marks dictionary : {student_marks.keys()}\n")
print(f"Values in the student_marks dictionary : {student_marks.values()}\n")
print(f"Items in the student_marks dictionary : {student_marks.items()}\n")

'''Sets (Operations):'''
print("---------------Sets (Operations): -----------------\n")
#a. Create a set called my_set with following values: ['a','e','i','o','u','a','a','i']
my_set={'a','e','i','o','u','a','a','i'}

#Analyse the output and provide explanation for the same.
print(f"Created set with values ['a','e','i','o','u','a','a','i']. After creating {my_set}- Set has removed the duplicate elements and un-ordered\n")


#b. Attempt to change the value of my_set[4] = 's'. If code throws an error, provide an explanation.
print("my_set[4]='s' This will throw TypeError because its un ordered cannot have fixed order for indexing."
      "Assigning a value in set is done through add() method\n")

'''c. Create two sets:
set1 with values: {1, 3, 5, 7, 9}
set2 with values: {2, 3, 5, 8, 10}'''
set1= {1, 3, 5, 7, 9}
set2={2, 3, 5, 8, 10}

#d. Compute and print the union and intersection of set1 and set2.
print(f"Set1 : {set1}\nSet2 : {set2}\nUnion of set1 and set2 : {set1.union(set2)}\nIntersection of set1 and set2 : {set1.intersection(set2)}\n")
#print(f"Intersection of set1 and set2 : {set1.intersection(set2)}\n")


'''Operators & Conditional Statements : 
(IF, ELIF, ELSE) 
Performance Category Program: 
1. Prompt user for Input. Score range should be from 0 to 10 (both inclusive). 
2. Find the performance category based on the input score using following criteria: 
a. Above Average:  Score greater than 7 
b. Average: Score between 4 and 7(both inclusive) 
c. Below Average: Score lesser than 4 
3. Output: Print the Performance category 
4. Additional Step: You can give a prompt of your choice to each category.  
For eg: If score below average “Need to Improve your performance, consistent 
practice will lead to better results”.  '''
print("---------------Operators & Conditional Statements : (IF, ELIF, ELSE)  -----------------\n")
score=int(input("Enter your score between 0 and 10: "))
if score>7:
    print(f"Score is {score}, Above Average: Excellent performance! You're consistently exceeding expectations.\n")
elif score>=4 and score<=7:
    print(f"Score is {score}, Average: Solid performance, but there's room to grow.\n")
else:
    print(f"Score is {score}, Below Average: This is a starting point — with focus and effort, progress is within reach.\n")