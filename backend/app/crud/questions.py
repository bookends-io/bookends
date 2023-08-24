from pymongo import MongoClient
from models.questions import Question
from typing import List
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'questions' collection
client = MongoClient(mongologin)
collection = client.bookends.questions

def create_question(question: Question) -> Question:
    question_data = question.dict()
    result = collection.insert_one(question_data)
    created_question = collection.find_one({"id": question.id})
    return Question(**created_question)

def get_question_by_id(id: str) -> Question:
    question = collection.find_one({"id": id})
    return Question(**question) if question else None

def get_all_questions() -> List[Question]:
    questions = list(collection.find({}))
    return [Question(**question) for question in questions]

def update_question(id: str, question: Question) -> Question:
    question_data = question.dict()
    result = collection.update_one({"id": id}, {"$set": question_data})
    if result.matched_count:
        updated_question = collection.find_one({"id": id})
        return Question(**updated_question)
    return None

def delete_question(id: str) -> None:
    collection.delete_one({"id": id})
