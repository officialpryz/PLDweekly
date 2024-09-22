def divisible_by_ten(num):
    # Check if the remainder when dividing num by 10 is 0
    if num % 10 == 0:
        return True
    else:
        return False

print(divisible_by_ten(50))  # Output: True
print(divisible_by_ten(23))  # Output: False
