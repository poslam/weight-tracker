from datetime import datetime

from database.database import get_session
from database.models import Weight
from fastapi import APIRouter, Depends
from sqlalchemy import delete, select
from sqlalchemy.ext.asyncio import AsyncSession

weight_router = APIRouter()


@weight_router.get("/view")
async def weight_view(
    begin: datetime = None,
    end: datetime = None,
    session: AsyncSession = Depends(get_session),
):
    stmt = select(Weight).order_by(Weight.create_dt.desc())

    if begin:
        stmt = stmt.where(Weight.create_dt >= begin)

    if end:
        stmt = stmt.where(Weight.create_dt <= end)

    weights = (await session.execute(stmt)).scalars().all()

    weights_float = [weight.weight for weight in weights]

    return {
        "result": (
            {
                "start": weights_float[-1],
                "end": weights_float[0],
                "max": max(weights_float),
                "min": min(weights_float),
                "diff_period": round(weights_float[0] - weights_float[-1], 1),
            }
            if len(weights_float) > 0
            else {"start": 0, "end": 0, "max": 0, "min": 0, "diff_period": 0}
        ),
        "data": weights,
    }


@weight_router.post("/add")
async def weight_add(
    weight: float,
    session: AsyncSession = Depends(get_session),
):
    weight = Weight(
        weight=weight,
        user_id=1,
        create_dt=datetime.now(),
    )

    session.add(weight)
    await session.commit()

    return {"detail": "weight add success"}


@weight_router.post("/delete")
async def weight_delete(
    weight_id: int,
    session: AsyncSession = Depends(get_session),
):
    await session.execute(delete(Weight).where(Weight.id == weight_id))
    await session.commit()

    return {"detail": "weight delete success"}
