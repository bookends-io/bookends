from pydantic import BaseModel, Field
from uuid import uuid4
from enum import Enum
from typing import List

class QuestionType(str, Enum):
    MULTIPLE_CHOICE = "multiple_choice"
    SHORT_ANSWER = "short_answer"
    CHECKBOX = "checkbox"
    LONG_ANSWER = "long_answer"

class EndOfDayQuestion(BaseModel):
    order: int
    questionId: str = Field(default_factory=lambda: str(uuid4()))
    question: str
    type: QuestionType
    
class EndOfDayQuestionsCollection(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    questions: List[EndOfDayQuestion]

    class Config:
        orm_mode = True
