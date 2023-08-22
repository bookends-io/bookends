from pydantic import BaseModel, Field
from typing import List
from .answer_group import AnswerGroup
from uuid import uuid4

class Response(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    bookendId: str
    questionnaireId: str
    userId: str
    answers: List[AnswerGroup]