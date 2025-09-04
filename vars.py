# DON'T add anything here just add in render's secret or env section 
from os import environ

API_ID = int(environ.get("API_ID", "29490954"))
API_HASH = environ.get("API_HASH", "dbd8f5af56b0f6e16327c20a84eece99")
BOT_TOKEN = environ.get("BOT_TOKEN", "")

