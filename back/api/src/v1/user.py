from database.models import User
from fastapi import APIRouter, Depends
from src.schemas.user import UserViewSchema
from src.v1.auth import login_required

user_router = APIRouter()


@user_router.get("/view")
async def user_view(
    user: User = Depends(login_required),
):
    user.password = ""
    
    return user