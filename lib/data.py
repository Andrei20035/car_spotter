import requests
from bs4 import BeautifulSoup

url = 'https://www.autoevolution.com/cars/'
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
}

try:
    # Send a request to the page
    response = requests.get(url, headers=headers)
    response.raise_for_status()  # Raise an error for bad responses
    dart_file_path = 'lib/models/car_brands.dart'

    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')

    # Find the select element containing car makes
    select_element = soup.find('div', class_ = 'container carlist clearfix')

    if select_element:
        # Extract all options within the select element
        options = select_element.find_all('span', itemprop= "name")

        # Create a dictionary to hold the brand information
        brands = []

        # Iterate through the options and extract brand names and values
        for option in options:
            brand_name = option.text.strip()
            brands.append(brand_name)

        # Print the extracted car brands
        # for brand_name, brand_value in brands.items():
        #     print(f"Brand: {brand_name}, Value: {brand_value}")
    else:
        print("Select element with data-testid='qs-select-make' not found.")

    with open(dart_file_path, "w") as dart_file:
        dart_file.write("List<String> carBrands = [\n")
        for brand in brands:
            dart_file.write(f'  "{brand.upper()}", \n')
        dart_file.write("];\n")
    print(f"Dart file '{dart_file_path}' was generated.")
except requests.exceptions.RequestException as e:
    print(f"Error fetching page: {e}")

except Exception as e:
    print(f"An error occurred: {e}")
