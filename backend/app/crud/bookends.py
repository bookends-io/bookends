from typing import Any, Dict, Optional, List
import os
from bson import ObjectId
from pymongo import MongoClient
from pymongo.collection import Collection
from app.models.bookends import UserResponse
from app.models.responses import MorningResponse, NightResponse

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'responses' collection
client = MongoClient(mongologin)
collection: Collection = client.bookends.responses

def get_all() -> List[Dict[str, Any]]:
    bookends = list(collection.find({}))
    for bookend in bookends:
        bookend["_id"] = str(bookend["_id"])  # Convert ObjectId to string
    return bookends

def get_by_id(id: str) -> Optional[Dict[str, Any]]:
    response = collection.find_one({"_id": ObjectId(id)})
    if response:
        response["_id"] = str(response["_id"])  # Convert ObjectId to string
    return response

def create(response_in: UserResponse) -> Dict[str, Any]:
    response_in = response_in.dict()
    result = collection.insert_one(response_in)
    response_id = result.inserted_id
    response = collection.find_one({"_id": response_id})
    response["_id"] = str(response["_id"]) # Convert ObjectId to string
    return response

def get_responses_by_user(user_id: str) -> List[Dict[str, Any]]:
    responses = list(collection.find({"userId": user_id}))
    for item in responses:
        item["_id"] = str(item["_id"])  # Convert ObjectId to string
    return responses

def get_responses_by_question(question_id: str) -> List[Dict[str, Any]]:
    responses = list(collection.find({"questionId": question_id}))
    for item in responses:
        item["_id"] = str(item["_id"])  # Convert ObjectId to string
    return responses

def update_bookend(id: str, morning_response: Optional[MorningResponse] = None, night_response: Optional[NightResponse] = None) -> Dict[str, Any]:
    bookend = collection.find_one({"id": id})
    if bookend:
        if morning_response:
            bookend["startOfDayAnswers"] = [answer.dict() for answer in morning_response.answers]
        if night_response:
            bookend["endOfDayAnswers"] = [answer.dict() for answer in night_response.endOfDayAnswers]

        result = collection.update_one({"id": id}, {"$set": bookend})
        updated_bookend = collection.find_one({"id": id})

        if updated_bookend:
            updated_bookend["_id"] = str(updated_bookend["_id"])  # Convert ObjectId to string
        
        return updated_bookend
    else:
        raise Exception("Bookend not found")



def delete(id: str) -> None:
    collection.delete_one({"_id": ObjectId(id)})
