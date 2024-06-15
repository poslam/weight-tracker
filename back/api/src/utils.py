from config import HOST
from database.database import get_session
from database.models import Photo
from fastapi import Depends, HTTPException
from sqlalchemy import desc, select
from sqlalchemy.ext.asyncio import AsyncSession


async def photo_search(
    obj: str, obj_id: int, session: AsyncSession = Depends(get_session)
):
    PHOTO_HOST = f"{HOST}/api/v1/img?path="

    allowed_objs = ["room", "client"]

    if obj not in allowed_objs:
        raise HTTPException(status_code=400, detail="obj not allowed")

    stmt = select(Photo.path).where(Photo.obj == obj).where(Photo.obj_id == obj_id)

    if obj == "client":
        stmt = stmt.order_by(desc(Photo.time))

    photos = (await session.execute(stmt)).all()

    result = []

    for photo_raw in photos:
        photo = photo_raw._mapping["path"]

        result.append(PHOTO_HOST + photo)

    return result
