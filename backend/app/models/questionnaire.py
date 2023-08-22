from pydantic import BaseModel, Field
from typing import List, Optional
from .questions import Question
from uuid import uuid4

class Questionnaire(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    name: str
    description: Optional[str] = None
    questions: List[str]
