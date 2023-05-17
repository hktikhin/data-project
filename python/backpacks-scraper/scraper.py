import httpx 
import csv 
import os
from urllib.parse import urljoin

from selectolax.parser import HTMLParser
from dataclasses import dataclass, asdict, fields

@dataclass
class Product:
    name: str 
    sku: str
    price: str 
    rating: str

@dataclass
class Response:
    body_html: HTMLParser
    next_page: dict

def get_page(client, url):
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36"
    }
    resp = client.get(url, headers=headers)
    html = HTMLParser(resp.text)
    if html.css_first("a[data-id=pagination-test-link-next]"):
        next_page = html.css_first("a[data-id=pagination-test-link-next]").attributes
    else:
        next_page = {"href": False}
    return Response(body_html=html, next_page=next_page)

def extract_text(html, selector, index):
    try:
        return html.css(selector)[index].text(strip=True)
    except IndexError:
        return "none"
    
def parse_detail(html) -> Product:
    new_product = Product(
        name=extract_text(html, "h1#product-page-title",0),
        sku=extract_text(html, "span#product-item-number",0),
        price=extract_text(html, "span#buy-box-product-price",0),
        rating=extract_text(html, "span.cdr-rating__number_13-3-1",0),
    )
    return new_product
    
def to_csv(data: list[dict]):
    filename = 'backpacks.csv'
    fieldnames=[f.name for f in fields(Product)]
    # check if the file exists and is not empty
    if os.path.isfile(filename) and os.path.getsize(filename) > 0:
        write_header = False
    else:
        write_header = True
        
    with open(filename, "a", newline="") as csvfile:
        # create a CSV writer object
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        # write the header row
        if write_header: writer.writeheader()
        # write the data rows in bulk
        writer.writerows(data)    


def detail_page_loop(client, page: Response):
    base_url = "https://www.rei.com/"
    product_links = parse_links(page.body_html)
    result: list[dict] = []
    for link in product_links:
        detail_page = get_page(client, urljoin(base_url, link))
        product = parse_detail(detail_page.body_html)
        result.append(asdict(product))
    to_csv(result)

def parse_links(html):
    links = html.css("div#search-results > ul li > a")
    return {link.attrs["href"] for link in links}

def pagintation_loop(client):
    url = "https://www.rei.com/c/hiking-backpacks"
    while True:
        page = get_page(client, url)
        detail_page_loop(client, page)
        if page.next_page["href"] is False:
            client.close()
            break
        else:
            url = urljoin(url, page.next_page["href"])
            print(url)

def main():
    client = httpx.Client()
    pagintation_loop(client)

if __name__ == "__main__":
    main()
    







