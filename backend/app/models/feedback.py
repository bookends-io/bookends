from pydantic import BaseModel
from datetime import datetime

class DailyFeedbackBase(BaseModel):
    user_id: str
    question_id: str
    date: datetime
    rating: int
    feedback: str

class DailyFeedbackCreate(DailyFeedbackBase):
    pass

class DailyFeedback(DailyFeedbackBase):
    id: int

    class Config:
        orm_mode = True
