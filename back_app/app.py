from random import randint

from flask import Flask, jsonify


app = Flask(__name__)

@app.route('/')
def process_requests():
   return jsonify(f"Your lucky number is {randint(1, 100)}")


if __name__ == '__main__':
   app.run(port=5000)