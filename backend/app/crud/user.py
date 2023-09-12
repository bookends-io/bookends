from pymongo import MongoClient
from ..models.user import User
from typing import List
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'users' collection
client = MongoClient(mongologin)
collection = client.bookends.users

def create_user(user: User) -> User:
    user_data = user.dict()
    result = collection.insert_one(user_data)
    created_user = collection.find_one({"id": user.id})
    return User(**created_user)

def get_user_by_id(id: str) -> User:
    user = collection.find_one({"id": id})
    return User(**user) if user else None

def get_all_users() -> List[User]:
    users = collection.find({})
    return [User(**user) for user in users]

def update_user(id: str, user: User) -> User:
    user_data = user.dict()
    collection.update_one({"id": id}, {"$set": user_data})
    return get_user_by_id(id)

def delete_user(id: str) -> None:
    collection.delete_one({"id": id})
