from typing import Any, Dict, Optional, Union

from pymongo import MongoClient
from pymongo.collection import Collection

from app.models.question import QuestionCreate

# Connect to MongoDB and get the 'questions' collection
client = MongoClient('mongodb://localhost:27017/')
collection: Collection = client.mydatabase.questions

def get_by_id(id: int) -> Optional[Dict[str, Any]]:
    return collection.find_one({"id": id})

def create(question_in: QuestionCreate) -> Dict[str, Any]:
    question_in = question_in.dict()
    result = collection.insert_one(question_in)
    question_id = result.inserted_id
    return collection.find_one({"_id": question_id})
