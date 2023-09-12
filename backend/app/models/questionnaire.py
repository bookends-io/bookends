from pydantic import BaseModel, Field
from typing import List, Optional
from .questions import Question
from uuid import uuid4
from datetime import datetime
class Questionnaire(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    name: str
    description: Optional[str] = None
    questions: List[str]
    created_at: datetime = Field(default_factory=datetime.utcnow)
    updated_at: Optional[datetime] = None
