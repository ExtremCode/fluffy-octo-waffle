import requests

from flask import Flask


app = Flask(__name__)

@app.route('/')
def redirect_requests():
   return requests.get("http://backend-service/").text


if __name__ == '__main__':
   app.run(port=8000)