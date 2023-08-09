from typing import Any, Dict, Optional, Union
import os
from pymongo import MongoClient
from pymongo.collection import Collection

from app.models.response import ResponseCreate
mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'responses' collection
client = MongoClient({mongologin})
collection: Collection = client.bookends.responses

def get_by_id(id: int) -> Optional[Dict[str, Any]]:
    return collection.find_one({"id": id})

def create(response_in: ResponseCreate) -> Dict[str, Any]:
    response_in = response_in.dict()
    result = collection.insert_one(response_in)
    response_id = result.inserted_id
    return collection.find_one({"_id": response_id})
