# Program to find common integers between two sets

def get_integer_set(set_name):
    integer_set = set()
    while True:
        user_input = input(f"Enter an integer for {set_name} (or 'done' to finish): ")
        if user_input.lower() == 'done':
            break
        try:
            number = int(user_input)
            integer_set.add(number)
        except ValueError:
            print("Invalid input. Please enter an integer.")
    return integer_set

# Get two sets of integers from user
set1 = get_integer_set("Set 1")
set2 = get_integer_set("Set 2")

# Find common elements
common_elements = set1.intersection(set2)

# Print results
print(f"\nSet 1: {set1}")
print(f"Set 2: {set2}")
print(f"Common elements: {common_elements}")