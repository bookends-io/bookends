from typing import Any, Dict, Optional, Union, List
import os
from bson import Binary
from pymongo import MongoClient
from pymongo.collection import Collection
from app.models.questionnaire import QuestionnaireCollection
from uuid import uuid4

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'questions' collection
client = MongoClient({mongologin})
collection: Collection = client.bookends.questionnaire_collections


def get_all() -> List[QuestionnaireCollection]:
    questionnaires = list(collection.find({}))
    for questionnaire in questionnaires:
        questionnaire["_id"] = str(questionnaire["_id"])  # Convert ObjectId to string
    return questionnaires


def get_by_id(id: str) -> QuestionnaireCollection:
    return collection.find_one({"id": id})

def create(questionnaire_collection: QuestionnaireCollection) -> QuestionnaireCollection:
    # Convert UUIDs to strings
    questionnaire_collection.id = str(questionnaire_collection.id)
    for questionnaire in questionnaire_collection.questionnaires:
        for question in questionnaire.questions:
            question.questionId = str(question.questionId)
    
    result = collection.insert_one(questionnaire_collection.dict(by_alias=True))
    created_questionnaire = collection.find_one({"_id": result.inserted_id})
    created_questionnaire["_id"] = str(created_questionnaire["_id"])  # Convert ObjectId to string
    return created_questionnaire



def update(id: str, questionnaire_collection: QuestionnaireCollection) -> QuestionnaireCollection:
    # Don't update the id, so we'll exclude it from the update
    update_data = {k: v for k, v in questionnaire_collection.dict(by_alias=True).items() if k != "id"}
    result = collection.update_one({"id": id}, {"$set": update_data})
    return collection.find_one({"id": id})

def delete(id: str) -> None:
    collection.delete_one({"id": id})




# def get_by_id(id: int) -> Optional[Dict[str, Any]]:
#     return collection.find_one({"id": id})

# def create(question_in: QuestionCreate) -> Dict[str, Any]:
#     question_in = question_in.dict()
#     result = collection.insert_one(question_in)
#     question_id = result.inserted_id
#     question = collection.find_one({"_id": question_id})
#     question["_id"] = str(question["_id"])  # Convert ObjectId to string
#     return question

