from pydantic import BaseModel, EmailStr, Field, PlainSerializer, field_validator


class LoginSchema(BaseModel):
    email: str
    password: str

    @field_validator("email", "password")
    @classmethod
    def fixer(cls, v: str) -> str:
        return v.lstrip(" ").rstrip(" ")


class SignUpSchema(BaseModel):
    email: EmailStr
    first_name: str
    second_name: str
    third_name: str | None = None
    password: str

    @field_validator("email", "password")
    @classmethod
    def pass_fixer(cls, v: str) -> str:
        return v.lstrip(" ").rstrip(" ")

    @field_validator("first_name", "second_name", "third_name")
    @classmethod
    def name_fixer(cls, v: str) -> str:
        return (
            v.lstrip(" ")
            .rstrip(" ")
            .capitalize()
            .replace(",", "")
            .replace("_", "")
            .replace(".", "")
            .capitalize()
        )
