import csv

with open('queens_retail_for_lease_4_15_cleaned.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    fieldnames = reader.fieldnames + ['Updated Address']
    with open('queens_retail_for_lease_4_7_updated.csv', 'w', newline='') as outfile:
        writer = csv.DictWriter(outfile, fieldnames=fieldnames)
        writer.writeheader()
        for row in reader:
            updated_address = row['Address'] + ', Queens, NY'
            writer.writerow(dict(row, **{'Updated Address': updated_address}))
