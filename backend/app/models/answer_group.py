from pydantic import BaseModel, Field
from typing import List
from .answers import Answer
from uuid import uuid4

class AnswerGroup(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    responseId: str
    questionnaireId: str
    answers: List[Answer]