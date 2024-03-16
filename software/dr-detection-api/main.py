import os
import uvicorn
from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from predict import PredictDr


app = FastAPI()
dr_predictor = PredictDr()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

ALLOWED_EXTENSIONS = {'jpg', 'jpeg', 'png'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    if not allowed_file(file.filename):
        raise HTTPException(status_code=400, detail="Invalid file format")
    image_path = "./temp_image.jpeg"
    with open(image_path, "wb") as buffer:
        buffer.write(await file.read())
    predicted_class = dr_predictor.predict_image(image_path)
    os.remove(image_path)
    return {"predicted_class": predicted_class}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
