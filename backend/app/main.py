from fastapi import FastAPI, HTTPException
from typing import List, Optional
from dotenv import load_dotenv
load_dotenv()
from fastapi.middleware.cors import CORSMiddleware
from .crud.user import create_user, get_user_by_id, get_all_users, update_user, delete_user
from models.user import User
from crud.bookends import create_bookend as create_bookend_crud
from crud.bookends import update_bookend as update_bookend_crud
from crud.bookends import delete_bookend as delete_bookend_crud
from crud.bookends import get_bookend_by_id, get_all_bookends
from models.bookends import Bookend
from models.questionnaire import Questionnaire
from crud.questionnaire import create_questionnaire as create_questionnaire_crud
from crud.questionnaire import delete_questionnaire as delete_questionnaire_crud
from crud.questionnaire import update_questionnaire as update_questionnaire_crud
from crud.questionnaire import get_all_questionnaires, get_questionnaire_by_id
from models.questions import Question
from crud.questions import create_question as create_question_crud
from crud.questions import get_question_by_id, get_all_questions
from crud.questions import update_question as update_question_crud
from crud.questions import delete_question as delete_question_crud
from models.responses import Response as ResponseModel
from crud.responses import create_response as create_response_crud
from crud.responses import get_response_by_id, get_responses_by_bookend_id
from crud.responses import update_response as update_response_crud
from crud.responses import delete_response as delete_response_crud
from models.answer_group import AnswerGroup as AnswerGroupModel
from crud.answer_group import create_answer_group as create_answer_group_crud
from crud.answer_group import get_answer_group_by_id, get_answer_groups_by_response_id
from crud.answer_group import update_answer_group as update_answer_group_crud
from crud.answer_group import delete_answer_group as delete_answer_group_crud
from models.answers import Answer as AnswerModel
from crud.answers import create_answer as create_answer_crud
from crud.answers import get_answer_by_id, get_answers_by_answer_group_id
from crud.answers import update_answer as update_answer_crud
from crud.answers import delete_answer as delete_answer_crud
import logging
logging.basicConfig(level=logging.DEBUG)

app = FastAPI()

# CORS Required
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], 
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"Hello": "World"}

# User Section
@app.post("/user")
def create_user_endpoint(user: User):
    return create_user(user)

@app.get("/user/{id}")
def get_user_by_id_endpoint(id: str):
    return get_user_by_id(id)

@app.get("/users")
def get_all_users_endpoint():
    return get_all_users()

@app.put("/user/{id}")
def update_user_endpoint(id: str, user: User):
    return update_user(id, user)

@app.delete("/user/{id}")
def delete_user_endpoint(id: str):
    delete_user(id)
    return {"message": "User deleted successfully"}

# Bookend Section

# Get all bookends
@app.get("/bookendall/getall")
def read_all_bookends_getall(fields: Optional[str] = ""):
    bookends = get_all_bookends()  
    
    if fields:
        requested_fields = fields.split(",")
        resolved_bookends = []
        
        for bookend in bookends:
            resolved_bookend = {}
            
            for field in requested_fields:
                if field == 'id':
                    resolved_bookend['id'] = convert_id(bookend.id)
                elif field == 'questionnaires':
                    resolved_questionnaires = []
                    
                    for q_id in bookend.questionnaires:
                        questionnaire = get_questionnaire_by_id(q_id)  
                        
                        if questionnaire:
                            questions = []
                            for question_id in questionnaire.questions:
                                question = get_question_by_id(question_id)  
                                if question:
                                    questions.append(question)
                            
                            resolved_questionnaires.append({
                                "name": questionnaire.name,
                                "questions": questions,
                                "id": questionnaire.id
                            })
                    
                    resolved_bookend['questionnaires'] = resolved_questionnaires
                else:
                    resolved_bookend[field] = getattr(bookend, field, None)
            
            resolved_bookends.append(resolved_bookend)
        
        return {"bookends": resolved_bookends}
    else:
        return {"bookends": bookends}

# Get bookend by ID
@app.get("/bookendall/{id}")
def get_bookend(id: str, fields: Optional[str] = ""):
    bookend = get_bookend_by_id(id)
    
    if bookend is None:
        raise HTTPException(status_code=404, detail="Bookend not found")
    
    if fields:
        requested_fields = fields.split(",")
        resolved_bookend = {}
                  
        for field in requested_fields:
                if field == 'id':
                    resolved_bookend['id'] = convert_id(bookend.id)
                elif field == 'questionnaires':
                    resolved_questionnaires = []
                    
                    for q_id in bookend.questionnaires:
                        questionnaire = get_questionnaire_by_id(q_id)  
                        
                        if questionnaire:
                            questions = []
                            for question_id in questionnaire.questions:
                                question = get_question_by_id(question_id)  
                                if question:
                                    questions.append(question)
                            
                            resolved_questionnaires.append({
                                "name": questionnaire.name,
                                "questions": questions,
                                "id": questionnaire.id
                            })
                    
                    resolved_bookend['questionnaires'] = resolved_questionnaires
                else:
                    resolved_bookend[field] = getattr(bookend, field, None)
            

        return {"bookend": resolved_bookend}
    else:
        return {"bookend": bookend}

@app.post("/bookends")
def create_bookend(bookend: Bookend):
    new_bookend = create_bookend_crud(bookend)
    return new_bookend

@app.get("/bookends/{id}")
def read_bookend(id: str):
    bookend = get_bookend_by_id(id)
    return bookend

@app.get("/bookends")
def read_all_bookends():
    bookends = get_all_bookends()
    return {"bookends": bookends}

@app.put("/bookends/{id}")
def update_bookend(id: str, bookend: Bookend):
    updated_bookend = update_bookend_crud(id, bookend)
    return updated_bookend

@app.delete("/bookends/{id}")
def delete_bookend(id: str):
    # Logic to delete a bookend
    return {"message": "Bookend deleted"}

# Questionnaire Section

@app.post("/questionnaires")
def create_questionnaire(questionnaire: Questionnaire):
    new_questionnaire = create_questionnaire_crud(questionnaire)
    return new_questionnaire

# Get all questions from all questionnaires
@app.get("/questionnaires")
def read_all_questionnaires(fields: Optional[str] = ""):
    questionnaires = get_all_questionnaires()
    
    if fields:
        requested_fields = fields.split(",")
        resolved_questionnaires = []
        
        for questionnaire in questionnaires:
            resolved_questionnaire = {}
            
            for field in requested_fields:
                if field == 'id':
                    resolved_questionnaire['id'] = convert_id(questionnaire.id)
                elif field == 'questions':
                    resolved_questions = []
                    
                    for question_id in questionnaire.questions:
                        question = get_question_by_id(question_id)  
                        
                        if question:
                            resolved_questions.append(question)
                    
                    resolved_questionnaire['questions'] = resolved_questions
                else:
                    resolved_questionnaire[field] = getattr(questionnaire, field, None)
            
            resolved_questionnaires.append(resolved_questionnaire)
        
        return {"questionnaires": resolved_questionnaires}
    else:
        return {"questionnaires": questionnaires}
    
# Get all questions from individual questionnaires
@app.get("/questionnaires/{id}")
def read_questionnaire(id: str, fields: Optional[str] = ""):
    questionnaire = get_questionnaire_by_id(id)
    
    if questionnaire is None:
        raise HTTPException(status_code=404, detail="Questionnaire not found")
    
    if fields:
        requested_fields = fields.split(",")
        resolved_questionnaire = {}
        
        for field in requested_fields:
            if field == 'id':
                resolved_questionnaire['id'] = convert_id(questionnaire.id)
            elif field == 'questions':
                resolved_questions = []
                
                for question_id in questionnaire.questions:
                    question = get_question_by_id(question_id)  
                    
                    if question:
                              resolved_questions.append({
                                    "text": question.text,
                                    "description": question.description,
                                    "type": question.type,
                                    "id": question.id
                                })     
                   
                resolved_questionnaire['questions'] = resolved_questions
            else:
                resolved_questionnaire[field] = getattr(questionnaire, field, None)
        
        return {"questionnaire": resolved_questionnaire}
    else:
        return {"questionnaire": questionnaire}

@app.put("/questionnaires/{id}")
def update_questionnaire(id: str, questionnaire: Questionnaire):
    updated_questionnaire = update_questionnaire_crud(id, questionnaire)
    return updated_questionnaire

@app.delete("/questionnaires/{id}")
def delete_questionnaire(id: str):
    delete_questionnaire_crud(id)
    return {"message": "Questionnaire deleted"}

# Question Section

@app.post("/questions")
def create_question(question: Question):
    new_question = create_question_crud(question)
    return new_question

@app.get("/questions/{id}")
def read_question(id: str):
    question = get_question_by_id(id)
    return question

@app.get("/questions")
def read_all_questions():
    questions = get_all_questions()
    return {"questions": questions}

@app.put("/questions/{id}")
def update_question(id: str, question: Question):
    updated_question = update_question_crud(id, question)
    return updated_question

@app.delete("/questions/{id}")
def delete_question(id: str):
    delete_question_crud(id)
    return {"message": "Question deleted"}

# Reponse Section

@app.post("/responses")
def create_response(response: ResponseModel):
    new_response = create_response_crud(response)
    return new_response

@app.get("/responses/{id}")
def read_response(id: str):
    response = get_response_by_id(id)
    return response

@app.get("/responses/bookend/{bookend_id}")
def read_responses_by_bookend_id(bookend_id: str):
    responses = get_responses_by_bookend_id(bookend_id)
    return {"responses": responses}

@app.put("/responses/{id}")
def update_response(id: str, response: ResponseModel):
    updated_response = update_response_crud(id, response)
    return updated_response

@app.delete("/responses/{id}")
def delete_response(id: str):
    delete_response_crud(id)
    return {"message": "Response deleted"}

# Answer Section

@app.post("/answers")
def create_answer(answer: AnswerModel):
    new_answer = create_answer_crud(answer)  # Step 1: Create Answer
    
    answer_group = get_answer_groups_by_response_id(answer.responseId)  # Step 2: Check AnswerGroup
    
    if not answer_group:
    # Create a new answer group if it doesn't exist
        answer_group_data = {
            "responseId": answer.responseId,
            "questionnaireId": answer.questionnaireId,
            "userId": answer.userId,
            "answers": [new_answer.id]
        }
        answer_group = create_answer_group_crud(AnswerGroupModel(**answer_group_data))
    else:
        # Update existing AnswerGroup
        answer_group.answers.append(new_answer.id)
        answer_group = update_answer_group(answer_group.id, answer_group)
        
    # Check if a Response already exists for this Bookend and User
    response = get_response_by_id(answer.responseId)  # Step 3: Check Response
    if not response:
        # Create a new response if it doesn't exist
        response_data = {
            "bookendId": answer.bookendId,
            "questionnaireId": answer.questionnaireId,
            "userId": answer.userId,
            "answers": [answer_group.id]
        }
        response = create_response_crud(ResponseModel(**response_data))
    else:
        # Update existing Response
        if answer_group.id not in response.answers:
            response.answers.append(answer_group.id)
            response = update_response(response.id, response)
      
    return new_answer


# @app.post("/answers")
# def create_answer(answer: AnswerModel):
#     new_answer = create_answer_crud(answer)
#     return new_answer

@app.get("/answers/{id}")
def read_answer(id: str):
    answer = get_answer_by_id(id)
    return answer

@app.get("/answers/answer-group/{answer_group_id}")
def read_answers_by_answer_group_id(answer_group_id: str):
    answers = get_answers_by_answer_group_id(answer_group_id)
    return {"answers": answers}

@app.put("/answers/{id}")
def update_answer(id: str, answer: AnswerModel):
    updated_answer = update_answer_crud(id, answer)
    return updated_answer

@app.delete("/answers/{id}")
def delete_answer(id: str):
    delete_answer_crud(id)
    return {"message": "Answer deleted"}

# Answer Group Section

@app.post("/answer-groups")
def create_answer_group(answer_group: AnswerGroupModel):
    new_answer_group = create_answer_group_crud(answer_group)
    return new_answer_group

@app.get("/answer-groups/{id}")
def read_answer_group(id: str):
    answer_group = get_answer_group_by_id(id)
    return answer_group

@app.get("/answer-groups/response/{response_id}")
def read_answer_groups_by_response_id(response_id: str):
    answer_groups = get_answer_groups_by_response_id(response_id)
    return {"answer_groups": answer_groups}

@app.put("/answer-groups/{id}")
def update_answer_group(id: str, answer_group: AnswerGroupModel):
    updated_answer_group = update_answer_group_crud(id, answer_group)
    return updated_answer_group

@app.delete("/answer-groups/{id}")
def delete_answer_group(id: str):
    delete_answer_group_crud(id)
    return {"message": "Answer group deleted"}

def convert_id(id_value: str) -> str:
    return f"converted-{id_value}"


