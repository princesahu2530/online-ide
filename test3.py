from google import genai
import os
from dotenv import load_dotenv
load_dotenv('d:/GitHub/Clones/online-ide/Backend/Genai/.env')

client = genai.Client()
try:
    response = client.models.generate_content(
        model='gemini-2.0-flash',
        contents='hello'
    )
    print("Success:", response.text)
except Exception as e:
    import traceback
    traceback.print_exc()
