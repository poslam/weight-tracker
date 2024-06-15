from datetime import datetime

from pydantic import BaseModel


class ReviewAddSchema(BaseModel):
    name: str
    text: str | None = None
