from typing import Any, Dict, Optional, Union
import os
from pymongo import MongoClient
from pymongo.collection import Collection

from app.models.user import UserCreate, UserUpdate
mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'users' collection
client = MongoClient({mongologin})
collection: Collection = client.bookends.users

def get_by_provider_id(provider_id: str) -> Optional[Dict[str, Any]]:
    return collection.find_one({"provider_id": provider_id})

def get_by_username(username: str) -> Optional[Dict[str, Any]]:
    user = collection.find_one({"username": username})
    if user:
        user["_id"] = str(user["_id"])  # Convert ObjectId to string
    return user


def create(user_in: UserCreate) -> Union[Dict[str, Any], str]:
    existing_user = get_by_username(user_in.username)
    if existing_user:
        return "Username already exists. Please choose a different username."
    user_in = user_in.dict()
    user_in["is_active"] = True
    result = collection.insert_one(user_in)
    user_id = result.inserted_id
    user = collection.find_one({"_id": user_id})
    user["_id"] = str(user["_id"])  # Convert ObjectId to string
    return user

def update(username: str, user_in: UserUpdate) -> Dict[str, Any]:
    user_data = user_in.dict(exclude_unset=True)
    collection.update_one({"username": username}, {"$set": user_data})
    return get_by_username(username)
