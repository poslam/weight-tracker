from pydantic import BaseModel, EmailStr, Field, PlainSerializer, field_validator

from database.models import UserTypes


class UserViewSchema(BaseModel):
    email: EmailStr
    first_name: str
    second_name: str
    third_name: str | None = None
    type: UserTypes
    bookings: list
    reviews: list
    
    class Config:
        from_attributes = True
