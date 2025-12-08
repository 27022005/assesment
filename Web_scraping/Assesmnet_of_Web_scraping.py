import requests
from bs4 import BeautifulSoup
import pandas as pd

url = "https://quotes.toscrape.com"

headers = {"User-Agent": "Mozilla/5.0"}
response = requests.get(url, headers=headers)

if response.status_code != 200:
    print("Website not accessible")
    exit()

soup = BeautifulSoup(response.text, "html.parser")

quotes_data = []

quotes = soup.find_all("div", class_="quote")
print("Total quotes found:", len(quotes))

for quote in quotes:
    text = quote.find("span", class_="text").text.strip()
    author = quote.find("small", class_="author").text.strip()
    
    tags = quote.find_all("a", class_="tag")
    tag_list = [tag.text for tag in tags]
    
    quotes_data.append({
        "Quote": text,
        "Author": author,
        "Tags": ", ".join(tag_list)
    })

df = pd.DataFrame(quotes_data)

df.to_csv("quotes_scraped.csv", index=False, encoding="utf-8-sig")

print("\n✅ SCRAPING SUCCESSFUL!")
print(df.head())
