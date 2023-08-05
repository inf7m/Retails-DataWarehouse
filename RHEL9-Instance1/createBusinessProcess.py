import datetime
import csv
import configparser
import random

configuration = configparser.ConfigParser
csvWriter = csv.writer()


def getCurrentDate() -> datetime.date:
    return datetime.date.today()  # YYYY-MM-DD


def outputFilePath() -> str:
    stringFilePath = "/BusinessProcess/BusinessProcess-" + str(getCurrentDate())+'.csv'
    return stringFilePath


csvWriter = csv.writer(outputFilePath(), 'a')


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
    for i in range(1, 2000):
        csvWriter.writerow(createBusinessProcess())
