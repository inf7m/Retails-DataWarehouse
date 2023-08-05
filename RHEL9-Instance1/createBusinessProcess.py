import datetime
import csv
import configparser
import random
configuration = configparser.ConfigParser
csvWriter = csv.writer()
def getCurrentDate() -> datetime.date:
    return datetime.date.today() # YYYY-MM-DD

def outputFilePath() -> str:
    stringFilePath = "BusinessProcess-"+str(getCurrentDate())
    return stringFilePath

csvWriter = csv.writer(outputFilePath(),'a')




def createBusinessProcess() -> list:
    saleQuantity = random.randint(1,10)
    regularPrice = random.randint(100,499)
    discountUnitPrice = random.randint(1,20)
    netUnitPrice = random.randint(40,99)
    # Extended things : 4 -> default as 0
    resultRows = list(saleQuantity,regularPrice,discountUnitPrice,netUnitPrice,0,0,0,0, str(datetime.date.today()),)
    return

with open(outputFilePath(), 'a') as BusinessProcess_Output:
        csvWriter.writerow()