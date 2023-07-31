import string
import random

vowels = "aeiou"
consonants = "bcdfghjklmnpqrstvwxyz"
names = []


def create100_randomName() -> list:
    for x in range(100):
        name_length = random.randint(5, 10)
        name = ""
        for y in range(name_length):
            if y == 0:
                name += random.choice(string.ascii_letters).upper()
            else:
                if random.choice([0, 1]) == 0:
                    name += random.choice(vowels)
                else:
                    name += random.choice(consonants)
        names.append(name)
    return names
