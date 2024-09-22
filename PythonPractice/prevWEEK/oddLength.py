# Program to filter words with odd number of characters

# Get words from user
words = input("Enter a list of words separated by spaces: ").split()

# Use list comprehension to filter words with odd number of characters
odd_length_words = [word for word in words if len(word) % 2 != 0]

# Print results
print("\nOriginal list of words:", words)
print("Words with odd number of characters:", odd_length_words)