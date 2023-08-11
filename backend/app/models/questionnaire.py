from pydantic import BaseModel, UUID4, Field
from typing import List, Optional, Union
from enum import Enum
from uuid import UUID, uuid4

    
class QuestionType(str, Enum):
    MULTIPLE_CHOICE = "multiple_choice"
    SHORT_ANSWER = "short_answer"
    CHECKBOX = "checkbox"
    LONG_ANSWER = "long_answer"
    
class QuestionReliesOn(BaseModel):
    questionnaireOrder: int
    questionId: str = Field(default_factory=lambda: str(uuid4()))
    
class QuestionModel(BaseModel):
    order: int
    questionId: str = Field(default_factory=lambda: str(uuid4()))
    question: str
    type: QuestionType
    questionReliesOn: Optional[QuestionReliesOn] = None    
    
class Questionnaire(BaseModel):
    name: str
    questions: List[QuestionModel]
            
class QuestionnaireCollection(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid4()))
    name: str
    public: bool
    questionnaires: List[Questionnaire]  
    
    class Config:
        orm_mode = True
        
