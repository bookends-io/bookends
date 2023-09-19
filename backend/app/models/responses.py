from pydantic import BaseModel, Field
from typing import List, Optional
from .answer_group import AnswerGroup
from uuid import uuid4
from datetime import datetime
class Response(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    bookendId: Optional[str] 
    questionnaireId: str
    userId: str
    answers: List[AnswerGroup]
    createdAt: datetime = Field(default_factory=datetime.utcnow)
    updatedAt: Optional[datetime] = None
