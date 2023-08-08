from pydantic import BaseModel
from typing import List, Optional

class QuestionBase(BaseModel):
    text: str
    created_by_user_id: int

class QuestionCreate(QuestionBase):
    pass

class Question(QuestionBase):
    id: int
    shared_with_user_ids: Optional[List[int]] = []

    class Config:
        orm_mode = True
