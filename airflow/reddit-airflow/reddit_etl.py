import pandas as pd
import s3fs 
import requests
import os 

from pytz import timezone
from dotenv import load_dotenv
from datetime import datetime 

def parse_data(data: dict)->dict:
    use_cols = [
        "subreddit",
        "title",
        "selftext",
        "upvote_ratio",
        "ups",
        "downs",
        "score",
        "created_utc",
        "name"
    ]
    return {
        col : data[col] for col in use_cols
    }

def run_reddit_etl(): 
    load_dotenv()

    # http authentication scheme with password and user
    # Pub/Private key from reddit
    auth = requests.auth.HTTPBasicAuth(
        os.environ['CLIENT_ID'],
        os.environ['SECRET_KEY']
    )

    # Send login data to reddit for getting auth token
    data = {
        "grant_type": "password",
        "username": os.environ['name'],
        "password": os.environ['pw'],
    }

    headers = {
        "User-Agent": "MyAPI/0.0.1"
    }

    res_token = requests.post(
        "https://www.reddit.com/api/v1/access_token",
        auth = auth,
        data = data,
        headers = headers
    )

    TOKEN = res_token.json()["access_token"]

    headers = {**headers, "Authorization": f"bearer {TOKEN}"}

    # Stream lastest post
    res_data = requests.get(
        "https://oauth.reddit.com/r/python/new", 
        headers=headers,
        params = {"limit": 100}
    )

    df = pd.DataFrame(
        [parse_data(row["data"]) for row in res_data.json()["data"]["children"]]
    )

    df.to_json(
        f"s3://airflow-reddit-thlawab/reddit-python-data-{datetime.now(tz=timezone('Asia/Hong_Kong')).strftime('%Y.%m.%d.%H.%M')}.json", 
        orient="records"
    )

if __name__ == "__main__":
    run_reddit_etl()
