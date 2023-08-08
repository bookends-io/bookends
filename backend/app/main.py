from fastapi import FastAPI

from app.crud import user, question, response

app = FastAPI()

@app.post("/users/")
def create_user(user: user.UserCreate):
    return user.create(user)

@app.get("/users/{username}")
def read_user(username: str):
    return user.get_by_username(username)

@app.post("/questions/")
def create_question(question: question.QuestionCreate):
    return question.create(question)

@app.get("/questions/{id}")
def read_question(id: int):
    return question.get_by_id(id)

@app.post("/responses/")
def create_response(response: response.ResponseCreate):
    return response.create(response)

@app.get("/responses/{id}")
def read_response(id: int):
    return response.get_by_id(id)
