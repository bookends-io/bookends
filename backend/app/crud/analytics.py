from typing import Any, Dict, List
from pymongo import MongoClient
from pymongo.collection import Collection
import os
from dotenv import load_dotenv
load_dotenv()

mongologin = os.getenv("BOOKENDS_MONGO")

# Connect to MongoDB and get the 'feedback' collection
client = MongoClient(mongologin)
feedback_collection: Collection = client.bookends.feedback

def get_feedback_trends() -> List[Dict[str, Any]]:
    pipeline = [
        {"$group": {"_id": "$date", "count": {"$sum": 1}}},
        {"$sort": {"_id": 1}}
    ]
    trends = list(feedback_collection.aggregate(pipeline))
    return trends

def get_top_questions() -> List[Dict[str, Any]]:
    pipeline = [
        {"$group": {"_id": "$question_id", "count": {"$sum": 1}}},
        {"$sort": {"count": -1}},
        {"$limit": 10}
    ]
    top_questions = list(feedback_collection.aggregate(pipeline))
    return top_questions
