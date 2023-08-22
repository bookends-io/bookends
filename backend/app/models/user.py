from pydantic import BaseModel, Field
from typing import Optional
from uuid import uuid4

class User(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    name: str
    email: str
    photoUrl: Optional[str] = None
