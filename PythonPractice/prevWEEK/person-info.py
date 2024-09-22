# Program to store and display person information using a dictionary

# Initialize an empty dictionary
person = {}

# Get user input
person['name'] = input("Enter the person's name: ")
person['age'] = input("Enter the person's age: ")
person['favorite_color'] = input("Enter the person's favorite color: ")

# Print the dictionary
print("\nPerson Information:")
for key, value in person.items():
    print(f"{key.capitalize()}: {value}")