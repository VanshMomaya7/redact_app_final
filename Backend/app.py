from fastapi import FastAPI, UploadFile, HTTPException
from hash_utils import hash_image_bytes
from blockchain_client import store_record
import requests
import google.generativeai as genai

app = FastAPI()

# HuggingFace Space endpoint
HUGGINGFACE_API_URL = "https://vansh180-daksh159-plant-disease-api.hf.space/predict"

# Gemini API configuration
GEMINI_API_KEY = "AIzaSyAIFK3GArqBJS7UrB-bzSEE6jp84AbrE4c"
genai.configure(api_key=GEMINI_API_KEY)
gemini_model = genai.GenerativeModel('gemini-2.5-flash')

def get_agricultural_recommendations(disease_name):
    """Get AI-powered agricultural recommendations for detected disease"""
    try:
        # Clean up disease name for better prompt
        clean_disease = disease_name.replace("___", " - ").replace("_", " ")
        
        prompt = f"""You are an agricultural expert advisor. A farmer has detected {clean_disease} in their crop.

Provide practical, actionable agricultural recommendations in the following format:

**Immediate Actions:**
(List 2-3 immediate steps the farmer should take)

**Treatment Options:**
(Provide both organic and chemical treatment methods)

**Preventive Measures:**
(List 3-4 preventive measures to avoid future occurrences)

**Best Practices:**
(Share 2-3 best practices for crop health)

Keep the language simple and farmer-friendly. Be concise but comprehensive."""

        response = gemini_model.generate_content(prompt)
        return response.text
    except Exception as e:
        print(f"Gemini API error: {str(e)}")
        return "Unable to generate recommendations at this time. Please consult with a local agricultural expert."

@app.post("/verify-and-store")
async def verify_and_store(file: UploadFile):
    try:
        # Step 1: Read image bytes
        img_bytes = await file.read()
        
        # Step 2: Generate SHA-256 hash
        img_hash = hash_image_bytes(img_bytes)
        print(f"Generated hash: {img_hash}")
        
        # Step 3: Store pending record on blockchain
        print("Storing pending record on blockchain...")
        pending_tx_hash = store_record(img_hash, "pending")
        print(f"Pending transaction hash: {pending_tx_hash}")
        
        # Step 4: Call HuggingFace ML model
        print("Calling HuggingFace ML model...")
        files = {'file': ('image.jpg', img_bytes, 'image/jpeg')}
        hf_response = requests.post(HUGGINGFACE_API_URL, files=files, timeout=30)
        
        if hf_response.status_code != 200:
            raise HTTPException(
                status_code=500, 
                detail=f"HuggingFace API error: {hf_response.status_code}"
            )
        
        # Step 5: Parse prediction
        predictions = hf_response.json()
        if not predictions or len(predictions) == 0:
            raise HTTPException(status_code=500, detail="No predictions returned")
        
        top_prediction = predictions[0]['label']
        confidence = predictions[0]['score']
        print(f"Prediction: {top_prediction} ({confidence*100:.1f}%)")
        
        # Step 6: Get AI recommendations
        print("Generating AI recommendations...")
        recommendations = get_agricultural_recommendations(top_prediction)
        print(f"Recommendations generated: {len(recommendations)} characters")
        
        # Step 7: Update blockchain with actual prediction
        print("Updating blockchain with prediction...")
        update_tx_hash = store_record(img_hash, top_prediction)
        print(f"Update transaction hash: {update_tx_hash}")
        
        # Step 8: Return complete response
        return {
            "hash": img_hash,
            "prediction": top_prediction,
            "confidence": confidence,
            "pending_tx": pending_tx_hash,
            "update_tx": update_tx_hash,
            "recommendations": recommendations
        }
        
    except requests.exceptions.RequestException as e:
        raise HTTPException(status_code=500, detail=f"HuggingFace API request failed: {str(e)}")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error: {str(e)}")

@app.get("/")
async def root():
    return {"message": "Blockchain-secured disease detection API with AI recommendations", "status": "running"}
