from models.bookends import Bookend
from typing import List
from pymongo import MongoClient
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")
client = MongoClient(mongologin)
collection = client.bookends.bookends

def create_bookend(bookend: Bookend) -> Bookend:
    bookend_data = bookend.dict()
    result = collection.insert_one(bookend_data)
    created_bookend = collection.find_one({"id": bookend.id})
    return Bookend(**created_bookend)

def get_bookend_by_id(id: str) -> Bookend:
    bookend = collection.find_one({"id": id})
    return Bookend(**bookend) if bookend else None

def get_all_bookends() -> List[Bookend]:
    bookends = collection.find({})
    return [Bookend(**bookend) for bookend in bookends]

def update_bookend(id: str, bookend: Bookend) -> Bookend:
    bookend_data = bookend.dict()
    collection.update_one({"id": id}, {"$set": bookend_data})
    return get_bookend_by_id(id)

def delete_bookend(id: str) -> None:
    collection.delete_one({"id": id})
