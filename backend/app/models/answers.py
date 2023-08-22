from pydantic import BaseModel, Field
from uuid import uuid4

class Answer(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    answerGroupId: str
    questionnaireId: str
    questionId: str
    answer: str