from typing import Any, Dict, Optional, List
import os
from pymongo import MongoClient
from pymongo.collection import Collection

from app.models.feedback import DailyFeedbackCreate

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'feedback' collection
client = MongoClient(mongologin)
collection: Collection = client.bookends.feedback

def get_by_id(id: int) -> Optional[Dict[str, Any]]:
    feedback = collection.find_one({"_id": id})
    if feedback:
        feedback["_id"] = str(feedback["_id"])  # Convert ObjectId to string
    return feedback

def create(feedback_in: DailyFeedbackCreate) -> Dict[str, Any]:
    feedback_in = feedback_in.dict()
    result = collection.insert_one(feedback_in)
    feedback_id = result.inserted_id
    feedback = collection.find_one({"_id": feedback_id})
    feedback["_id"] = str(feedback["_id"])  # Convert ObjectId to string
    return feedback

def get_user_progress(user_id: str) -> List[Dict[str, Any]]:
    progress = list(collection.find({"user_id": user_id}))
    for item in progress:
        item["_id"] = str(item["_id"])  # Convert ObjectId to string
    return progress
