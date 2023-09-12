from pydantic import BaseModel, Field
from typing import Optional
from uuid import uuid4
from datetime import datetime
class User(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    name: str
    email: str
    photoUrl: Optional[str] = None
    created_at: datetime = Field(default_factory=datetime.utcnow)
    updated_at: Optional[datetime] = None
