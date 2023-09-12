from pymongo import MongoClient
from ..models.answer_group import AnswerGroup
from typing import List
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'answer_groups' collection
client = MongoClient(mongologin)
collection = client.bookends.answer_groups

def create_answer_group(answer_group: AnswerGroup) -> AnswerGroup:
    answer_group_data = answer_group.dict()
    result = collection.insert_one(answer_group_data)
    created_answer_group = collection.find_one({"id": answer_group.id})
    return AnswerGroup(**created_answer_group)

def get_answer_group_by_id(id: str) -> AnswerGroup:
    answer_group = collection.find_one({"id": id})
    return AnswerGroup(**answer_group) if answer_group else None

def get_answer_groups_by_response_id(response_id: str) -> List[AnswerGroup]:
    answer_groups = list(collection.find({"responseId": response_id}))
    return [AnswerGroup(**answer_group) for answer_group in answer_groups]

def update_answer_group(id: str, answer_group: AnswerGroup) -> AnswerGroup:
    answer_group_data = answer_group.dict()
    collection.update_one({"id": id}, {"$set": answer_group_data})
    return get_answer_group_by_id(id)

def delete_answer_group(id: str) -> None:
    collection.delete_one({"id": id})
