import requests
from bs4 import BeautifulSoup
import csv

# Set the URL and query parameters
url = 'https://www.propertyshark.com/cre/retail/us/ny/queens/'
params = {'IncludeCoworking': 'false', 'CoworkingWorkspaceTypes': '0'}

# Create a CSV file to write the addresses to
with open('queens_retail_for_lease_4_15.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Address'])

    # Loop through each page of results
    for page_num in range(1, 13):  # There are 13 pages of results
        params['page'] = page_num
        response = requests.get(url, params=params)
        soup = BeautifulSoup(response.content, 'html.parser')

        # Find all the h2 divs with class 'building-name' and extract the text
        building_names = soup.find_all('h2', {'class': 'building-name'})
        addresses = [building_name.text.strip() for building_name in building_names]

        # Write the addresses to the CSV file
        for address in addresses:
            writer.writerow([address])
            
        print(f"Finished scraping page {page_num}")

print("Scraping complete!")