import csv
from datetime import datetime, date, timedelta
import os
import yaml

# checking YAML configuration file
if os.path.exists('config/promotion_info.yaml'):
    with open('config/promotion_info.yaml', 'r') as config_file:
        config_dict = yaml.load(config_file, Loader=yaml.FullLoader)

    dict(config_dict).keys()

    promotion1 = config_dict['Promotion1']

    promotion2 = config_dict['Promotion2']
    promotion3 = config_dict['Promotion3']
    promotion4 = config_dict['Promotion4']
    promotion5 = config_dict['Promotion5']
    promotion6 = config_dict['Promotion6']
    header = ['promotionID', 'PromotionName', 'PromotionDesc', 'PromotionStartDate', 'PromotionEndDate']
    # Create a function write date *csv file, with the header
    # PromotionStartDate starts with 2010-01-01 and ends with 2030-01-01
    startDate = date(2010, 1, 1)
    endDate = date(2030, 1, 1)
    currentDate = startDate

    year_range = [year for year in range(2010,2031)]

    # Write Promotion_master.csv file

    with open('data/Promotion_master.csv', 'w') as csvFile:
        csvWriter = csv.writer(csvFile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        index_yearRange = 0
        while currentDate <= endDate:

            # Promotion1 - New Yar Holiday
            csvWriter.writerow((promotion1['ID'], promotion1['Name'], promotion1['Description'], promotion1['StartDate']+'-'+str(year_range[index_yearRange]), promotion1['EndDate']+'-'+str(year_range[index_yearRange])))
            # Promotion2 - Valentine
            csvWriter.writerow((promotion2['ID'], promotion2['Name'], promotion2['Description'], promotion2['StartDate']+'-'+str(year_range[index_yearRange]), promotion2['EndDate']+'-'+str(year_range[index_yearRange])))
            # Promotion3 - Summer Sale
            csvWriter.writerow((promotion3['ID'], promotion3['Name'], promotion3['Description'], promotion3['StartDate']+'-'+str(year_range[index_yearRange]), promotion3['EndDate']+'-'+str(year_range[index_yearRange])))
            # Promotion4 - Children's day
            csvWriter.writerow((promotion4['ID'], promotion4['Name'], promotion4['Description'], promotion4['StartDate']+'-'+str(year_range[index_yearRange]), promotion4['EndDate']+'-'+str(year_range[index_yearRange])))
            # Promotion5 - Summer Sale
            csvWriter.writerow((promotion5['ID'], promotion5['Name'], promotion5['Description'], promotion5['StartDate']+'-'+str(year_range[index_yearRange]), promotion5['EndDate']+'-'+str(year_range[index_yearRange])))
            # Promotion6 - Christmas Holiday
            csvWriter.writerow((promotion6['ID'], promotion6['Name'], promotion6['Description'], promotion6['StartDate']+'-'+str(year_range[index_yearRange]), promotion6['EndDate']+'-'+str(year_range[index_yearRange])))

            currentDate = currentDate.replace(year=currentDate.year + 1)
            index_yearRange += 1

else:
    print("Configuration file not found")
    exit(1)
