# responses.py
from datetime import datetime
from uuid import uuid4
from pydantic import BaseModel, Field
from typing import List, Optional

class Answer(BaseModel):
    questionId: str = Field(default_factory=lambda: str(uuid4()))
    order: int
    answer: str
    timestamp: datetime
    satisfaction: Optional[int] = None

class MorningResponse(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    date: datetime
    username: str
    answers: List[Answer]

class NightResponse(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    date: datetime
    username: str
    endOfDayAnswers: List[Answer]

