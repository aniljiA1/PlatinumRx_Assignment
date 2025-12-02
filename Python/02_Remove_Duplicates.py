def remove_duplicates(input_string):
    """Remove duplicate characters from a string using a loop."""
    result = ""

    for char in input_string:
        if char not in result:
            result += char

    return result


# ---- Test ----
print(remove_duplicates("aabbccddeeff"))       # Output: abcdef
print(remove_duplicates("mississippi"))        # Output: misp
print(remove_duplicates("Programming"))        # Output: Progamin
