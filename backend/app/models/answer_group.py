from pydantic import BaseModel, Field
from typing import List, Optional
from .answers import Answer
from uuid import uuid4
from datetime import datetime
class AnswerGroup(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    responseId: str
    questionnaireId: str
    userId: str
    answers: List[str]
    created_at: datetime = Field(default_factory=datetime.utcnow)
    updated_at: Optional[datetime] = None
    # answers: List[Answer]