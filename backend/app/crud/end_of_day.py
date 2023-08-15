from typing import List
from app.models.end_of_day import EndOfDayQuestionsCollection
from pymongo import MongoClient
from pymongo.collection import Collection
import os
mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'questions' collection
client = MongoClient({mongologin})
collection: Collection = client.bookends.end_of_day_questions

def get_all_end_of_day() -> List[EndOfDayQuestionsCollection]:
    enddays = list(collection.find({}))
    for endday in enddays:
        endday["_id"] = str(endday["_id"])  # Convert ObjectId to string
    return enddays

def get_end_of_day_by_id(id: str) -> EndOfDayQuestionsCollection:
    endday = collection.find_one({"_id": ObjectId(id)})
    if endday:
        endday["_id"] = str(endday["_id"])  # Convert ObjectId to string
    return endday


def create_end_of_day(questions_collection: EndOfDayQuestionsCollection) -> EndOfDayQuestionsCollection:
    # Convert UUIDs to strings
    questions_collection.id = str(questions_collection.id)
    for question in questions_collection.questions:
        question.questionId = str(question.questionId)

    result = collection.insert_one(questions_collection.dict(by_alias=True))
    created_collection = collection.find_one({"_id": result.inserted_id})
    created_collection["_id"] = str(created_collection["_id"])  # Convert ObjectId to string
    return created_collection

# def update_end_of_day(id: str, questions_collection: EndOfDayQuestionsCollection) -> EndOfDayQuestionsCollection:
#     update_data = {k: v for k, v in questions_collection.dict(by_alias=True).items() if k != "id"}
#     result = collection.update_one({"id": id}, {"$set": update_data})
#     return collection.find_one({"id": id})

def update_end_of_day(id: str, questions_collection: EndOfDayQuestionsCollection) -> EndOfDayQuestionsCollection:
    update_data = {k: v for k, v in questions_collection.dict(by_alias=True).items() if k != "id"}
    result = collection.update_one({"id": id}, {"$set": update_data})
    updated_document = collection.find_one({"id": id})
    
    if updated_document:
        updated_document["_id"] = str(updated_document["_id"])  # Convert ObjectId to string
    
    return updated_document


def delete_end_of_day(id: str) -> None:
    collection.delete_one({"id": id})
