from fastapi import FastAPI

from app.crud import  response
from app.crud import user as user_crud
from app.models.user import UserCreate, UserUpdate
from app.crud import question as question_crud

app = FastAPI()

@app.post("/users/")
async def create_user(user: UserCreate):
    return user_crud.create(user)

@app.put("/users/{username}")
def update_user(username: str, user_in: UserUpdate):
    return user_crud.update(username, user_in)

@app.get("/users/{username}")
def read_user(username: str):
    return user_crud.get_by_username(username)

@app.post("/questions/")
def create_question(question: question_crud.QuestionCreate):
    return question_crud.create(question)

@app.get("/questions/{id}")
def read_question(id: int):
    return question_crud.get_by_id(id)

@app.post("/responses/")
def create_response(response: response.ResponseCreate):
    return response.create(response)

@app.get("/responses/{id}")
def read_response(id: int):
    return response.get_by_id(id)
