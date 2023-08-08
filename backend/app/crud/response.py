from typing import Any, Dict, Optional, Union

from pymongo import MongoClient
from pymongo.collection import Collection

from app.models.response import ResponseCreate

# Connect to MongoDB and get the 'responses' collection
client = MongoClient('mongodb://localhost:27017/')
collection: Collection = client.mydatabase.responses

def get_by_id(id: int) -> Optional[Dict[str, Any]]:
    return collection.find_one({"id": id})

def create(response_in: ResponseCreate) -> Dict[str, Any]:
    response_in = response_in.dict()
    result = collection.insert_one(response_in)
    response_id = result.inserted_id
    return collection.find_one({"_id": response_id})
