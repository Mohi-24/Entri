
S1="Hello"
S2=input("Enter your name :")
print(S1+" "+S2,"\n")
S3=", welcome to Python programming"
#print(S1+" "+S2+S3)

#2. String Slicing and Indexing:
S4=S1+" "+S2+S3
#S4="Hello Mohan, welcome to Python programming"
print(S4,"\n")

#a. Print the first character of the string.
print("First character of the string.")
print(S4[0]+"\n")


# b. Print the last character of the string.
print("Last character of the string using len function.")
print(S4[len(S4)-1]+"\n")
print("Last character of the string using Slicing.")
print(S4[-1]+"\n")

# c. Print the first 5 characters of the string.
print("first 5 character of the string.")
print(S4[0:5:1]+"\n")

# d. Print the last 11 characters of the string.
print("Last 11 character of the string.")
print(S4[-11::]+"\n")

# e. Print the string in reverse.
print("Reverse of the string.")
print(S4[-1::-1]+"\n")

# f. Use slicing and print the word “Python” from the existing string.
print("Printing the word “Python”") #this work irrespective to how many characters the name entered in input
print(S4[-18:-12:1]+"\n")

''' 3. String Methods: 
Write a Python program that takes a string, strM = “Python beginner tutorial” and 
perform the following tasks: 
'''

strM = "Python beginner tutorial"

#a. Convert the sentence to uppercase.
strM=strM.upper()
print("String in Upper Case :",strM,"\n")

#b. Convert the sentence to lowercase.
strM=strM.lower()
print(f"String in Lower Case : {strM}\n")

#c. Use Capitalize and return the sentence to the original input form.
strM=strM.capitalize()
print(f"String in Capitalized Case : {strM}\n")

#d. Count the total number of occurrences of character ‘t’  in the string.
print(f"Total number of occurrences of character ‘t’ in String '{strM}' is :{strM.count('t')}\n")

#e. Replace all occurrences of “Python” with “Machine Learning”  in the input string strM = “Python beginner tutorial”
print(f"Original String : {strM}\n")
strM=strM.replace("Python","Machine Learning")
print(f"Replaced String : {strM}\n")

#Create 1st tuple with values -> (10, 20, 30), 2nd tuple with values -> (40, 50, 60):
t1=(10,20,30)
t2=(40,50,60)

#a. Concatenate the two tuples and store it in “t_combine”
print("Concatenation of two tuples")
t_combine=t1.__add__(t2)
print(t_combine,"\n")

#b. Repeat the elements of “t_combine” 3 times
print("Repeating the elements of “t_combine” 3 times")
#t_combine=t_combine+t_combine+t_combine
t_combine=t_combine*3
print(t_combine,"\n")

#c. Access the 3rd element from “t_combine”
print(f"3rd Element of the tuple t_combine : {t_combine[2]}\n")

#d. Access the first three elements from “t_combine”
print(f"First 3 Elements of the tuple t_combine : {t_combine[:3]}\n")

#e. Access the last three elements from “t_combine”
print(f"Last 3 Elements of the tuple t_combine : {t_combine[-3:]}\n")