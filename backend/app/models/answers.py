from pydantic import BaseModel, Field
from uuid import uuid4
from typing import Optional
from datetime import datetime
class Answer(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    answerGroupId: str = Field(default_factory=lambda: str(uuid4()))
    responseId: str = Field(default_factory=lambda: str(uuid4()))
    bookendId: Optional[str]
    questionnaireId: str
    questionId: str
    answer: str
    userId: str
    createdAt: datetime = Field(default_factory=datetime.utcnow)
    updatedAt: Optional[datetime] = None
