from typing import List
from pydantic import BaseModel

class FeedbackTrend(BaseModel):
    date: str
    count: int

class TopQuestion(BaseModel):
    question_id: str
    count: int

class FeedbackTrends(BaseModel):
    trends: List[FeedbackTrend]

class TopQuestions(BaseModel):
    top_questions: List[TopQuestion]
