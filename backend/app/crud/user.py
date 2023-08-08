from typing import Any, Dict, Optional, Union

from pydantic import EmailStr
from pymongo import MongoClient
from pymongo.collection import Collection

from app.models.user import UserCreate

# Connect to MongoDB and get the 'users' collection
client = MongoClient('mongodb://localhost:27017/')
collection: Collection = client.mydatabase.users

def get_by_username(username: str) -> Optional[Dict[str, Any]]:
    return collection.find_one({"username": username})

def create(user_in: UserCreate) -> Dict[str, Any]:
    user_in = user_in.dict()
    user_in["is_active"] = True
    result = collection.insert_one(user_in)
    user_id = result.inserted_id
    return collection.find_one({"_id": user_id})
