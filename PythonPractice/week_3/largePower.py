def large_power(base, exponent):
    # Calculate the result of base to the power of exponent
    result = base ** exponent
    
    # Check if the result is greater than 5000
    if result > 5000:
        return True
    else:
        return False

print(large_power(10, 4))  # Output: True (10^4 = 10000)
print(large_power(3, 5))   # Output: False (3^5 = 243)
