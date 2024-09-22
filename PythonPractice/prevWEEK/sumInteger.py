# Program to create a list of integers and compute their sum

# Initialize an empty list
numbers = []

# Accept user input
while True:
    user_input = input("Enter an integer (or 'done' to finish): ")
    if user_input.lower() == 'done':
        break
    try:
        number = int(user_input)
        numbers.append(number)
    except ValueError:
        print("Invalid input. Please enter an integer.")

# Compute the sum
total = sum(numbers)

# Print the result
print(f"The list of numbers is: {numbers}")
print(f"The sum of all numbers is: {total}")