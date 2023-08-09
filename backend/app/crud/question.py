from typing import Any, Dict, Optional, Union
import os
from pymongo import MongoClient
from pymongo.collection import Collection

from app.models.question import QuestionCreate
mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'questions' collection
client = MongoClient({mongologin})
collection: Collection = client.bookends.questions

def get_by_id(id: int) -> Optional[Dict[str, Any]]:
    return collection.find_one({"id": id})

def create(question_in: QuestionCreate) -> Dict[str, Any]:
    question_in = question_in.dict()
    result = collection.insert_one(question_in)
    question_id = result.inserted_id
    question = collection.find_one({"_id": question_id})
    question["_id"] = str(question["_id"])  # Convert ObjectId to string
    return question

