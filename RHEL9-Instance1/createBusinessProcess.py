import datetime
import csv
import configparser
import random

configuration = configparser.ConfigParser



def getCurrentDate() -> datetime.date:
    return datetime.date.today()  # YYYY-MM-DD


def outputFilePath() -> str:
    stringFilePath = "/BusinesspProcess/" + str(getCurrentDate())+'.csv'
    return stringFilePath




def createBusinessProcess() -> list:
    saleQuantity = random.randint(1, 10)
    regularPrice = random.randint(100, 499)
    discountUnitPrice = random.randint(1, 20)
    netUnitPrice = random.randint(40, 99)
    # Extended things : 4 -> default as 0

    resultRows = [saleQuantity, regularPrice, discountUnitPrice, netUnitPrice, 0, 0, 0, 0,
                  str(datetime.date.today()), random.randint(1, 100), random.randint(1, 100),
                  random.randint(0, 44445), random.randint(209, 334), random.randint(1, 5)]
    return resultRows

with open(outputFilePath(), 'a') as BusinessProcess_Output:
    csvWriter = csv.writer(BusinessProcess_Output, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    for i in range(1, 2000):
        csvWriter.writerow(createBusinessProcess())