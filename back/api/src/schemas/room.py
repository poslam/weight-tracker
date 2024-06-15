from datetime import datetime
from pydantic import BaseModel


class RoomAddSchema(BaseModel):
    name: str
    description: str
    price: float


class BookSchema(BaseModel):
    room_id: int
    begin_d: datetime
    end_d: datetime
