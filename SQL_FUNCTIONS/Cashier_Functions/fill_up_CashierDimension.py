import csv

header = ["CashierID", "Cashier_empID", "CashierName"]


# Declare 2 sets
first_names = {'Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fiona', 'George', 'Hannah', 'Isaac', 'Julia'}
last_names = {'Smith', 'Johnson', 'Brown', 'Lee', 'Garcia', 'Taylor', 'Clark', 'Wang', 'Lopez', 'Robinson'}

# Create a list of full names by combining elements from first_names and last_names
full_names_list = [f"{first_name} {last_name}" for first_name in first_names for last_name in last_names]


cashier_id = [number for number in range(1000, 1201)]

with open("data/Cashier_master.csv", "w") as csv_file:
    csvWriter = csv.writer(csv_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    csvWriter.writerow(header)
    for i in range(1, 101):
        csvWriter.writerow((i,
                            cashier_id[i - 1],
                            full_names_list[i - 1]))


