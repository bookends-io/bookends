from pydantic import BaseModel
from typing import Optional

class ResponseBase(BaseModel):
    user_id: int
    question_id: int
    response_text: str

class ResponseCreate(ResponseBase):
    pass

class Response(ResponseBase):
    id: int

    class Config:
        orm_mode = True
