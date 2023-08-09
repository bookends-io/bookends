from pydantic import BaseModel
from typing import Optional

class UserBase(BaseModel):
    username: str
    email: Optional[str] = None
    provider_id: Optional[str] = None  # Unique ID from the third-party provider
    provider_name: Optional[str] = None  # Name of the third-party provider (Google, Microsoft, etc.)

class UserCreate(UserBase):
    password: Optional[str] = None

class User(UserBase):
    id: int
    is_active: bool

    class Config:
        orm_mode = True

class UserUpdate(BaseModel):
    email: Optional[str] = None
    provider_name: Optional[str] = None
    # Add other fields that can be updated
