from models.responses import Response
from typing import List
from pymongo import MongoClient
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'responses' collection
client = MongoClient(mongologin)
collection = client.bookends.responses

def create_response(response: Response) -> Response:
    response_data = response.dict()
    result = collection.insert_one(response_data)
    created_response = collection.find_one({"id": response.id})
    return Response(**created_response)

def get_response_by_id(id: str) -> Response:
    response = collection.find_one({"id": id})
    return Response(**response) if response else None

def get_responses_by_bookend_id(bookend_id: str) -> List[Response]:
    responses = collection.find({"bookendId": bookend_id})
    return [Response(**response) for response in responses]

def update_response(id: str, response: Response) -> Response:
    response_data = response.dict()
    collection.update_one({"id": id}, {"$set": response_data})
    return get_response_by_id(id)

def delete_response(id: str) -> None:
    collection.delete_one({"id": id})
