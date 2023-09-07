from pydantic import BaseModel, Field
from typing import List, Optional
from .questionnaire import Questionnaire
from uuid import uuid4
from datetime import datetime
class Bookend(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    name: str
    description: Optional[str] = None
    public: bool
    questionnaires: Optional[List[str]] = None
    created_at: datetime = Field(default_factory=datetime.utcnow)
    updated_at: Optional[datetime] = None
