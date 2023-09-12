from pymongo import MongoClient
from ..models.answers import Answer
from typing import List
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'answers' collection
client = MongoClient(mongologin)
collection = client.bookends.answers

def create_answer(answer: Answer) -> Answer:
    answer_data = answer.dict()
    result = collection.insert_one(answer_data)
    created_answer = collection.find_one({"id": answer.id})
    return Answer(**created_answer)

def get_answer_by_id(id: str) -> Answer:
    answer = collection.find_one({"id": id})
    return Answer(**answer) if answer else None

def get_answers_by_answer_group_id(answer_group_id: str) -> List[Answer]:
    answers = list(collection.find({"answerGroupId": answer_group_id}))
    return [Answer(**answer) for answer in answers]

def update_answer(id: str, answer: Answer) -> Answer:
    answer_data = answer.dict()
    result = collection.update_one({"id": id}, {"$set": answer_data})
    if result.matched_count:
        updated_answer = collection.find_one({"id": id})
        return Answer(**updated_answer)
    return None

def delete_answer(id: str) -> None:
    collection.delete_one({"id": id})
