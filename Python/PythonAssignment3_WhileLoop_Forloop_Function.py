import random
# Generate random number between 1 and 10
print("\n--------------------------- Guess number game -----------------------------------\n")
secret_number = random.randint(1,10)
print("Welcome to the Guessing Game!")
attempt = 0
while True:
    guess_num = int(input("Please input a number to guess the number.\n"))

    if guess_num != secret_number:
        if guess_num > 10:
            print("Guess number is out of range.Enter a value between 1 and 10.\n")
            continue
        elif guess_num > secret_number:
            print("Guess number is greater than the secret number.\n")
        else:
            print("Guess number is lower than the secret number.\n")

        attempt += 1
        if attempt == 3:
            print(f"Sorry You have exceeded the maximum number of attempts. Better luck next time!!\U0001F622\nThe secret number was : {secret_number}\n")
            break

    else:
        print("Awesome!!!\U0001F600 You have Guessed the secret number correctly\n")
        break


print("--------------------------- Multiplication Table Generator -----------------------------------\n")
num=int(input("Please input a number to populate your multiplication table."))
for i in range(1,11):
    print(f"{num} x {i} = {num*i}")


print("\n ---------------------------- BMI Calculator ---------------------------\n")
weight = float(input("Please input your weight in kilograms: "))
height = float(input("Please input your height in meters: "))

def calculate_bmi(weight, height):
    bmi = weight / (height * height)
    return round(bmi,2)

print(f"\nYour BMI is: {calculate_bmi(weight, height)}")