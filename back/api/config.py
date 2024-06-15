import os

from dotenv import load_dotenv

load_dotenv()

DB_HOST = os.environ.get("DB_HOST")
DB_PORT = os.environ.get("DB_PORT")
DB_NAME = os.environ.get("DB_NAME")
DB_USER = os.environ.get("DB_USER")
DB_PASS = os.environ.get("DB_PASS")

AUTH_SECRET = os.environ.get("AUTH_SECRET")
RT_SECRET = os.environ.get("RT_SECRET")
ALGORITHM = os.environ.get("ALGORITHM")

AUTH_TOKEN_LIFE = os.environ.get("AUTH_TOKEN_LIFE")
REFRESH_TOKEN_LIFE = os.environ.get("REFRESH_TOKEN_LIFE")

HOST = os.environ.get("HOST")
IMG_PATH = os.environ.get("IMG_PATH")