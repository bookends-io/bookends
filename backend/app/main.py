from fastapi import FastAPI, HTTPException
from typing import List
from app.crud import user as user_crud
from app.models.user import UserCreate, UserUpdate
from app.crud import questionnaire as questionnaire_crud
from app.models.questionnaire import QuestionnaireCollection
# from app.models.responses import UserResponse
# from app.crud import responses as responses_crud
from app.crud import feedback as feedback_crud
from app.models.feedback import DailyFeedbackCreate
from app.models.analytics import FeedbackTrends, TopQuestions
from app.crud import analytics as analytics_crud
from app.models.bookends import UserResponse, Answer
from app.crud.bookends import create, get_by_id, delete, update_bookend, get_all
from app.crud.end_of_day import (get_all_end_of_day, get_end_of_day_by_id, create_end_of_day,
                                 update_end_of_day, delete_end_of_day)
from app.models.end_of_day import EndOfDayQuestionsCollection
from app.models.responses import MorningResponse, NightResponse
from app.crud.responses import create_morning_response, get_morning_response_by_id, create_night_response, get_night_response_by_id, update_morning_response, update_night_response, delete_morning_response, delete_night_response


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

# Might remove these two and handle with analytics later
@app.post("/feedback/")
def create_daily_feedback(feedback: DailyFeedbackCreate):
    return feedback_crud.create(feedback)

@app.get("/progress/{user_id}")
def get_user_progress(user_id: str):
    return feedback_crud.get_user_progress(user_id)

# Section handles generating a questionnaire, or modifying an existing one
@app.get("/questionnaire-collections/")
def get_questionnaire_collections():
    return questionnaire_crud.get_all()

@app.get("/questionnaire-collections/{id}")
def get_questionnaire_collection(id: str):
    collection = questionnaire_crud.get_by_id(id)
    if collection is None:
        raise HTTPException(status_code=404, detail="Collection not found")
    return collection

@app.post("/questionnaire-collections/")
def create_questionnaire_collection(questionnaire_collection: QuestionnaireCollection):
    return questionnaire_crud.create(questionnaire_collection)

@app.put("/questionnaire-collections/{id}")
def update_questionnaire_collection(id: str, questionnaire_collection: QuestionnaireCollection):
    return questionnaire_crud.update(id, questionnaire_collection)

@app.delete("/questionnaire-collections/{id}")
def delete_questionnaire_collection(id: str):
    questionnaire_crud.delete(id)
    return {"message": "Collection deleted successfully"}


# Section handles generating a new bookend, then storing answers
# for morning and evening questions with feedback.
@app.post("/bookends/")
def create_bookend(bookend: UserResponse):
    return create(bookend)

@app.get("/bookends/")
def read_all_bookends():
    return get_all()

@app.get("/bookends/{id}")
def read_bookend(id: str):
    bookend = get_by_id(id)
    if bookend is None:
        raise HTTPException(status_code=404, detail="Bookend not found")
    return bookend


@app.put("/bookends/{id}/morning-response/")
def update_morning_response(id: str, response: MorningResponse):
    return update_bookend(id, morning_response=response)

@app.put("/bookends/{id}/night-response/")
def update_night_response(id: str, response: NightResponse):
    return update_bookend(id, night_response=response)

@app.put("/bookends/{id}/end-of-day-answers/")
def update_night_response(id: str, end_of_day_answers: List[Answer]):
    # Retrieve the existing bookend entry by ID
    bookend = get_by_id(id)
    if not bookend:
        raise HTTPException(status_code=404, detail="Bookend not found")

    # Update the endOfDayAnswers field with the provided answers
    bookend["endOfDayAnswers"] = end_of_day_answers

    # Update the bookend entry in the database (add your update logic here)
    update_bookend(id, bookend)

    return {"message": "End-of-Day Answers updated successfully"}


@app.delete("/bookends/{id}")
def delete_bookend(id: str):
    delete(id)
    return {"message": "Bookend deleted successfully"}


# End-of-Day Question handles generating and querying various questions
@app.get("/end-of-day-questions/")
def get_all_end_of_day_questions():
    return get_all_end_of_day()

@app.get("/end-of-day-questions/{id}/")
def get_end_of_day_questions_by_id(id: str):
    return get_end_of_day_by_id(id)

@app.post("/end-of-day-questions/")
def create_end_of_day_questions(questions_collection: EndOfDayQuestionsCollection):
    return create_end_of_day(questions_collection)

@app.put("/end-of-day-questions/{id}/")
def update_end_of_day_questions(id: str, questions_collection: EndOfDayQuestionsCollection):
    return update_end_of_day(id, questions_collection)

@app.delete("/end-of-day-questions/{id}/")
def delete_end_of_day_questions(id: str):
    delete_end_of_day(id)
    return {"message": "End-of-Day Questions deleted successfully"}

@app.post("/morning-responses/")
def create_morning_response_endpoint(response: MorningResponse):
    return create_morning_response(response)

@app.put("/night-responses/{id}")
def update_night_response_endpoint(id: str, response: NightResponse):
    return update_night_response(id, response)

@app.delete("/night-responses/{id}")
def delete_night_response_endpoint(id: str):
    delete_night_response(id)
    return {"message": "Night response deleted successfully"}

# @app.get("/analytics/feedback-over-time", response_model=FeedbackTrends)
# def get_feedback_over_time():
#     return {"trends": analytics_crud.get_feedback_trends()}

# @app.get("/analytics/top-questions", response_model=TopQuestions)
# def get_top_questions():
#     return {"top_questions": analytics_crud.get_top_questions()}
