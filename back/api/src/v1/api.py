import os
import uuid
from datetime import datetime

from config import IMG_PATH
from database.database import get_session
from database.models import Photo, User
from fastapi import APIRouter, BackgroundTasks, Depends, HTTPException, UploadFile
from fastapi.responses import FileResponse
from PIL import Image
from sqlalchemy import insert, select
from sqlalchemy.ext.asyncio import AsyncSession
from src.v1.auth import auth_router, login_required
from src.v1.user import user_router
from src.v1.weight import weight_router

router = APIRouter()

router.include_router(auth_router, prefix="/auth")
router.include_router(weight_router, prefix="/weight")
router.include_router(user_router, prefix="/user")


@router.get("/healthcheck")
async def index(session: AsyncSession = Depends(get_session)):
    try:
        await session.execute(select(User))
        return {"detail": "ok :)"}
    except Exception as e:
        print(e)
        return {"detail": "error"}


@router.get("/check_token")
async def token_checker(user=Depends(login_required)):
    return {"detail": "token is invalid"}


@router.get("/img")
async def img_receiver(
    img: str,
    back: BackgroundTasks,
    height: int = None,
    width: int = None,
):
    path = f"{IMG_PATH}/{img}"
    tmp_path = f"{IMG_PATH}/tmp"

    if height != None and width != None:
        try:
            os.stat(path)

            os.makedirs(tmp_path, exist_ok=True)

            src = Image.open(path)

            scale_percent = 0.8

            img_width = int(src.width * scale_percent)
            img_height = int(src.height * scale_percent)

            while img_width > width and img_height > height:
                scale_percent -= 0.05

                img_width = int(src.width * scale_percent)
                img_height = int(src.height * scale_percent)

            resized_tmp_img_path = f"{tmp_path}/{uuid.uuid1()}.webp"

            src.resize((img_width, img_height)).save(resized_tmp_img_path)

            back.add_task(os.remove, resized_tmp_img_path)

            return FileResponse(
                path=resized_tmp_img_path,
                background=back,
            )
        except Exception as e:
            print(e)
            raise HTTPException(status_code=404, detail="image not found")

    else:
        try:
            os.stat(path)

            return FileResponse(path)
        except:
            raise HTTPException(status_code=404, detail="image not found")


@router.post("/upload")
async def upload(
    files: list[UploadFile],
    room_id: int = None,
    user: User = Depends(login_required),
    session: AsyncSession = Depends(get_session),
):
    for file in files:
        contents = file.file.read()

        if room_id:
            id = room_id
            folder = "room"

        else:
            id = user.id
            folder = "user"

        os.makedirs(f"{IMG_PATH}/{folder}/{id}", exist_ok=True)

        x = True
        y = str(id) + "_0"
        z = 1

        try:
            while x:
                try:
                    os.stat(f"{IMG_PATH}/{folder}/{id}/{y}.webp")
                    y = f"{id}_{z}"
                    z += 1
                except:
                    x = False

                    with open(f"{IMG_PATH}/{folder}/{id}/{y}.webp", "wb") as f:
                        f.write(contents)

            photo = {
                "obj": folder,
                "obj_id": id,
                "path": f"{folder}/{id}/{y}.webp",
                "time": datetime.now(),
            }

            await session.execute(insert(Photo).values(photo))
            await session.commit()

        except Exception as e:
            print(e)
            raise HTTPException(status_code=500, detail="smth gone wrong")

    return {"detail": "img upload success"}
