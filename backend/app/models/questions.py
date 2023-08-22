from pydantic import BaseModel, Field
from typing import List, Optional
from uuid import uuid4

class Question(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    text: str
    description: Optional[str] = None
    type: str
    reliesOn: Optional[List['Question']] = None

    class Config:
        arbitrary_types_allowed = True
