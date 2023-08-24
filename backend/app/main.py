from fastapi import FastAPI, HTTPException
from typing import List
from dotenv import load_dotenv
load_dotenv()
from fastapi.middleware.cors import CORSMiddleware
from crud.user import create_user, get_user_by_id, get_all_users, update_user, delete_user
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

app = FastAPI()

# CORS Required
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], 
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# User Section
@app.post("/user/")
def create_user_endpoint(user: User):
    return create_user(user)

@app.get("/user/{id}/")
def get_user_by_id_endpoint(id: str):
    return get_user_by_id(id)

@app.get("/users/")
def get_all_users_endpoint():
    return get_all_users()

@app.put("/user/{id}/")
def update_user_endpoint(id: str, user: User):
    return update_user(id, user)

@app.delete("/user/{id}/")
def delete_user_endpoint(id: str):
    delete_user(id)
    return {"message": "User deleted successfully"}

# Bookend Section

@app.post("/bookends/")
def create_bookend(bookend: Bookend):
    new_bookend = create_bookend_crud(bookend)
    return new_bookend

@app.get("/bookends/{id}")
def read_bookend(id: str):
    bookend = get_bookend_by_id(id)
    return bookend

@app.get("/bookends/")
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

@app.post("/questionnaires/")
def create_questionnaire(questionnaire: Questionnaire):
    new_questionnaire = create_questionnaire_crud(questionnaire)
    return new_questionnaire

@app.get("/questionnaires/{id}")
def read_questionnaire(id: str):
    questionnaire = get_questionnaire_by_id(id)
    return questionnaire

@app.get("/questionnaires/")
def read_all_questionnaires():
    questionnaires = get_all_questionnaires()
    return {"questionnaires": questionnaires}

@app.put("/questionnaires/{id}")
def update_questionnaire(id: str, questionnaire: Questionnaire):
    updated_questionnaire = update_questionnaire_crud(id, questionnaire)
    return updated_questionnaire

@app.delete("/questionnaires/{id}")
def delete_questionnaire(id: str):
    delete_questionnaire_crud(id)
    return {"message": "Questionnaire deleted"}

# Question Section

@app.post("/questions/")
def create_question(question: Question):
    new_question = create_question_crud(question)
    return new_question

@app.get("/questions/{id}")
def read_question(id: str):
    question = get_question_by_id(id)
    return question

@app.get("/questions/")
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

@app.post("/responses/")
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

@app.post("/answers/")
def create_answer(answer: AnswerModel):
    new_answer = create_answer_crud(answer)
    return new_answer

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

@app.post("/answer-groups/")
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