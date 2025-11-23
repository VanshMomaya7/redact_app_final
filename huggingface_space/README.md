---
title: Plant Disease Detection API
emoji: 🌱
colorFrom: green
colorTo: blue
sdk: docker
pinned: false
---

# Plant Disease Detection API

This Space provides an API endpoint for plant disease detection using the MobileNetV2 model.

## Usage

Send a POST request to `/predict` with an image file:

```python
import requests

url = "https://YOUR-SPACE-NAME.hf.space/predict"
files = {"file": open("plant_image.jpg", "rb")}
response = requests.post(url, files=files)
print(response.json())
```

## Response Format

```json
[
  {
    "label": "disease_name",
    "score": 0.95
  },
  ...
]
```
