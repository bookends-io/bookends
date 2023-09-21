from pydantic import BaseModel, Field
from typing import List, Optional
from uuid import uuid4
from datetime import datetime
# Note to Amir, 
class Question(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    text: str
    description: Optional[str] = None
    type: str
    reliesOn: Optional[str]= None
    createdAt: datetime = Field(default_factory=datetime.utcnow)
    updatedAt: Optional[datetime] = None
    class Config:
        arbitrary_types_allowed = True
