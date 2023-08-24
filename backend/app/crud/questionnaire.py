from pymongo import MongoClient
from models.questionnaire import Questionnaire
from typing import List
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'questionnaires' collection
client = MongoClient(mongologin)
collection = client.bookends.questionnaires

def create_questionnaire(questionnaire: Questionnaire) -> Questionnaire:
    questionnaire_data = questionnaire.dict()
    result = collection.insert_one(questionnaire_data)
    created_questionnaire = collection.find_one({"id": questionnaire.id})
    return Questionnaire(**created_questionnaire)

def get_questionnaire_by_id(id: str) -> Questionnaire:
    questionnaire = collection.find_one({"id": id})
    return Questionnaire(**questionnaire) if questionnaire else None

def get_all_questionnaires() -> List[Questionnaire]:
    questionnaires = list(collection.find({}))
    return [Questionnaire(**questionnaire) for questionnaire in questionnaires]

def update_questionnaire(id: str, questionnaire: Questionnaire) -> Questionnaire:
    questionnaire_data = questionnaire.dict()
    collection.update_one({"id": id}, {"$set": questionnaire_data})
    return get_questionnaire_by_id(id)

def delete_questionnaire(id: str) -> None:
    collection.delete_one({"id": id})
