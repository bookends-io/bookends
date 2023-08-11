# responses_crud.py
from typing import Any, Dict, Optional, List
from pymongo import MongoClient
from pymongo.collection import Collection
from bson import ObjectId
from app.models.responses import MorningResponse, NightResponse
import os

mongologin = os.getenv("BOOKENDS_MONGO")
client = MongoClient(mongologin)

# Morning CRUD
morning_collection: Collection = client.bookends.morning_responses

def create_morning_response(response_in: MorningResponse) -> Dict[str, Any]:
    response_in = response_in.dict()
    result = morning_collection.insert_one(response_in)
    response_id = result.inserted_id
    response = morning_collection.find_one({"_id": response_id})
    response["_id"] = str(response["_id"])  # Convert ObjectId to string
    return response

def get_morning_response_by_id(id: str) -> Optional[Dict[str, Any]]:
    response = morning_collection.find_one({"_id": ObjectId(id)})
    if response:
        response["_id"] = str(response["_id"])  # Convert ObjectId to string
    return response

def update_morning_response(id: str, response_in: MorningResponse) -> Dict[str, Any]:
    update_data = {k: v for k, v in response_in.dict().items() if k != "id"}
    result = morning_collection.update_one({"_id": ObjectId(id)}, {"$set": update_data})
    return morning_collection.find_one({"_id": ObjectId(id)})

def delete_morning_response(id: str) -> None:
    morning_collection.delete_one({"_id": ObjectId(id)})

# Night CRUD
night_collection: Collection = client.bookends.night_responses

def create_night_response(response_in: NightResponse) -> Dict[str, Any]:
    response_in = response_in.dict()
    result = night_collection.insert_one(response_in)
    response_id = result.inserted_id
    response = night_collection.find_one({"_id": response_id})
    response["_id"] = str(response["_id"])  # Convert ObjectId to string
    return response

def get_night_response_by_id(id: str) -> Optional[Dict[str, Any]]:
    response = night_collection.find_one({"_id": ObjectId(id)})
    if response:
        response["_id"] = str(response["_id"])  # Convert ObjectId to string
    return response

def update_night_response(id: str, response_in: NightResponse) -> Dict[str, Any]:
    update_data = {k: v for k, v in response_in.dict().items() if k != "id"}
    result = night_collection.update_one({"_id": ObjectId(id)}, {"$set": update_data})
    return night_collection.find_one({"_id": ObjectId(id)})

def delete_night_response(id: str) -> None:
    night_collection.delete_one({"_id": ObjectId(id)})
