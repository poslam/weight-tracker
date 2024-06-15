import enum
from datetime import datetime
from typing import List

from database.database import base
from sqlalchemy import DateTime, Enum, Float, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship


class UserTypes(enum.Enum):
    admin = "admin"
    client = "client"


class RefreshTokenStorage(base):
    __tablename__ = "refresh_token_storage"

    id: Mapped[int] = mapped_column(primary_key=True)

    refresh_token: Mapped[str] = mapped_column()
    expired: Mapped[datetime] = mapped_column(DateTime(timezone=True))


class User(base):
    __tablename__ = "client"

    id: Mapped[int] = mapped_column(primary_key=True)

    first_name: Mapped[str] = mapped_column()
    second_name: Mapped[str] = mapped_column()
    third_name: Mapped[str] = mapped_column(nullable=True)

    email: Mapped[str] = mapped_column()
    password: Mapped[str] = mapped_column()

    type: Mapped[UserTypes] = mapped_column(Enum(UserTypes), default="client")

    reviews: Mapped[List["Weight"]] = relationship(
        cascade="all,delete",
        lazy="joined",
    )


class Weight(base):
    __tablename__ = "weight"

    id: Mapped[int] = mapped_column(primary_key=True)

    user_id: Mapped[int] = mapped_column(ForeignKey(User.id))
    weight: Mapped[float] = mapped_column(Float)

    create_dt: Mapped[datetime] = mapped_column(DateTime(timezone=True), nullable=True)


class Photo(base):
    __tablename__ = "photo"

    id: Mapped[int] = mapped_column(primary_key=True)

    obj: Mapped[str] = mapped_column()
    obj_id: Mapped[int] = mapped_column()

    path: Mapped[str] = mapped_column()
    time: Mapped[datetime] = mapped_column(DateTime(timezone=True))
