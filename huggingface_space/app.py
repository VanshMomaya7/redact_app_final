from fastapi import FastAPI, File, UploadFile
from fastapi.responses import JSONResponse
import torch
import torchvision.transforms as T
from torchvision import models
from PIL import Image
import io
import json
import os

app = FastAPI()

# -------------------------------------------------
# 1️⃣ Load the checkpoint and build the model
# -------------------------------------------------
model_name = "Daksh159/plant-disease-mobilenetv2"
import os
checkpoint_path = os.path.join(os.path.dirname(__file__), "mobilenetv2_plant.pth")

# MobileNet-V2 architecture with 38 classes
base_model = models.mobilenet_v2(pretrained=False)
# Replace the classifier to match 38 classes
base_model.classifier[1] = torch.nn.Linear(base_model.last_channel, 38)

# Load the checkpoint
state = torch.load(checkpoint_path, map_location="cpu")
if "state_dict" in state:
    state = state["state_dict"]
base_model.load_state_dict(state, strict=False)
base_model.eval()
model = base_model

# -------------------------------------------------
# 2️⃣ Pre-processing pipeline (same as training)
# -------------------------------------------------
preprocess = T.Compose([
    T.Resize(256),
    T.CenterCrop(224),
    T.ToTensor(),
    T.Normalize(mean=[0.485, 0.456, 0.406],
                std=[0.229, 0.224, 0.225]),
])

# -------------------------------------------------
# 3️⃣ Load label map
# -------------------------------------------------
label_map_path = "labels.json"
if os.path.exists(label_map_path):
    with open(label_map_path, "r") as f:
        idx2label = json.load(f)
else:
    idx2label = None

# -------------------------------------------------
# 4️⃣ API endpoints
# -------------------------------------------------
@app.get("/")
async def root():
    return {"message": "Plant Disease Detection API", "model": model_name, "classes": 38}

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    try:
        # Read image
        contents = await file.read()
        image = Image.open(io.BytesIO(contents)).convert("RGB")

        # Preprocess
        input_tensor = preprocess(image).unsqueeze(0)

        # Inference
        with torch.no_grad():
            logits = model(input_tensor)
            probs = torch.nn.functional.softmax(logits, dim=-1)

        # Top-k results
        top_probs, top_idxs = torch.topk(probs, k=5, dim=1)

        results = []
        for prob, idx in zip(top_probs[0], top_idxs[0]):
            label = idx2label.get(str(idx.item())) if idx2label else f"class_{idx.item()}"
            results.append({"label": label, "score": float(prob.item())})

        return JSONResponse(content=results)

    except Exception as e:
        return JSONResponse(status_code=500, content={"error": str(e)})

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=7860)
