# A very simple Flask Hello World app for you to get started with...
from flask import Flask, jsonify,request

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello from taha 4 !'


import asyncio
import replicate
import os

@app.route('/moussa')
async def Myreplicate(URL,prompt,neg_prompt) :
    api_token = "Your API"
    os.environ["REPLICATE_API_TOKEN"] = api_token
    api=replicate.Client(api_token=api_token)

    output = api.output = replicate.run(
    "philz1337x/clarity-upscaler:abd484acb51ad450b06f42f76940fa5c1b37511dbf70ac8594fdacd5c3302307",
    input={
        "seed": 1337,
        "image": URL,
        "prompt": prompt,
        "dynamic": 6,
        "sd_model": "juggernaut_reborn.safetensors [338b85bc4f]",
        "scheduler": "DPM++ 3M SDE Karras",
        "creativity": 0.35,
        "downscaling": False,
        "resemblance": 0.6,
        "scale_factor": 2,
        "tiling_width": 112,
        "tiling_height": 144,
        "negative_prompt": neg_prompt,
        "num_inference_steps": 18,
        "downscaling_resolution": 768
          }
            )

    return output[0]



@app.route('/process_data', methods=['POST'])
async def process_data():
    try:
        # Get JSON data from the request
        data = request.json

        # Extract specific data from the JSON payload
        if data is not None:
            extracted_data = {
                'URL': data.get('URL'),
                'prompt': data.get('prompt'),
                'neg_prompt': data.get('neg prompt'),
            }
            output= await Myreplicate(extracted_data["URL"],extracted_data["prompt"],extracted_data["neg_prompt"])

            # Return extracted data as JSON
            return jsonify({"output_URL":output})
        else:
            raise ValueError("Invalid JSON data")


    except ValueError as e:
        # Handle JSON parsing or data extraction errors
        error_message = str(e)
        return jsonify({'error': error_message}), 400

if __name__=="__main__" :
    app.run(debug=True,)
