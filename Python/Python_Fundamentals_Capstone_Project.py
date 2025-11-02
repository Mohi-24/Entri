import re


feedback_data = {
'S_No': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
'Name': ['Ravi', 'Meera', 'Sam', 'Anu', 'Raj', 'Divya', 'Arjun', 'Kiran', 'Leela', 'Nisha'],
'Feedback': [
' Very GOOD Service!!!',
'poor support, not happy ',
'GREAT experience! will come again.',
'okay okay...',
' not BAD',
'Excellent care, excellent staff!',
'good food and good ambience!',
'Poor response and poor handling of issue',
'Satisfied. But could be better.',
'Good support... quick service.'
],
'Rating': [5, 2, 5, 3, 2, 5, 4, 1, 3, 4]
}

'''✍️ Step 2: Add More Feedbacks (4 marks)

● For each feedback, collect the following inputs from the user:
○ Name
○ Written Feedback (text)
○ Rating (1–5)

● Automatically increment S_No starting from 11 onward.
● Append all new data into the feedback_data dictionary.'''

#● Ask the user to enter how many more feedbacks they want to add.
#print("Length of sno: ", len(feedback_data['S_No']))

special_chars = r"""!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"""

def text_clean(feedback):
    cleanData=[]

    for feed in feedback:
        for ch in special_chars:
            feed= feed.replace(ch,"").strip().lower()
            feed=re.sub(r'\s+', ' ', feed)


        cleanData.append(feed)
    return cleanData    
    
def count_word_in_feedbacks(word):
    count=0
    for feed in feedback_data['Feedback']:
            if word.lower() in feed.lower():
                count+=1

    return count

def unique_words_check(feedbacks):
    all_words = []
    for sentence in feedbacks:
        words = sentence.lower().split()  # lowercase for consistency
        all_words.extend(words)

    #Convert to a set to get unique words
    return set(all_words)


while True:
    getfeedback=input("\nDo yo want to give feedback answer y/n : ")
    
    if getfeedback=='y' or getfeedback=='Y':
        noOfFeedbacks=int(input("\nHow many more feedbacks you want to add : "))
        for i in range(noOfFeedbacks):
            feedback_data['S_No'].append(len(feedback_data['S_No'])+1)
            feedback_data['Name'].append(input("\nEnter your Name: "))
            feedback_data['Feedback'].append(input("\nEnter your Feedback: "))
            feedback_data['Rating'].append(int(input("\nEnter your Rating (1–5): ")))

        feedback_data['Feedback']=text_clean(feedback_data['Feedback'])
        print(f"\nFinal Cleansed Data: {feedback_data}\n")
        print(f"\nNo of feedbacks containing 'good' : {count_word_in_feedbacks('Good')}\n")
        print(f"\nNo of feedbacks containing 'poor' : {count_word_in_feedbacks('Poor')}\n")
        print(f"\nNo of feedbacks containing 'excellent' : {count_word_in_feedbacks('Excellent')}\n")

        #● Print the average rating from all feedbacks.
        print(f"\nThe Average rating from all feedbacks : {round(sum(feedback_data['Rating'])/len(feedback_data['Rating']),2)}\n")

        #● Find and display the feedback with the longest comment (in terms of word count).
        print(f"\nThe feedback with the longest comment (in terms of word count) : {max(feedback_data['Feedback'],key=len)}\n")

        #● Print the list of unique words used across all feedbacks (avoid duplicates).
        print(f"\nThe list of unique words used across all feedbacks : {unique_words_check(feedback_data['Feedback'])}\n")
        
    else:
        feedback_data['Feedback']=text_clean(feedback_data['Feedback'])
        print(f"\nFinal Cleansed Data: {feedback_data}\n")
        print(f"\nNo of feedbacks containing 'good' : {count_word_in_feedbacks('Good')}\n")
        print(f"\nNo of feedbacks containing 'poor' : {count_word_in_feedbacks('Poor')}\n")
        print(f"\nNo of feedbacks containing 'excellent' : {count_word_in_feedbacks('Excellent')}\n")

        #● Print the average rating from all feedbacks.
        print(f"\nThe Average rating from all feedbacks : {round(sum(feedback_data['Rating'])/len(feedback_data['Rating']),2)}\n")

        #● Find and display the feedback with the longest comment (in terms of word count).
        print(f"\nThe feedback with the longest comment (in terms of word count) : {max(feedback_data['Feedback'],key=len)}\n")

        #● Print the list of unique words used across all feedbacks (avoid duplicates).
        print(f"\nThe list of unique words used across all feedbacks : {unique_words_check(feedback_data['Feedback'])}\n")
        break

