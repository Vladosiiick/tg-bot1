import json
import os
import requests

TELEGRAM_TOKEN = os.environ["TELEGRAM_TOKEN"]
API_URL = f"https://api.telegram.org/bot{TELEGRAM_TOKEN}"


def send_message(chat_id, text):
    url = f"{API_URL}/sendMessage"
    payload = {"chat_id": chat_id, "text": text}
    requests.post(url, json=payload)


def lambda_handler(event, context):
    body = json.loads(event["body"])

    if "message" in body:
        chat_id = body["message"]["chat"]["id"]
        text = body["message"].get("text", "")

        if text.lower() == "пінг":
            send_message(chat_id, "Понг")

    return {"statusCode": 200}
