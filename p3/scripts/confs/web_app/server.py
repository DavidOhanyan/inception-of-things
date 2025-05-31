from flask import Flask, send_from_directory
import os

app = Flask(__name__)

@app.route('/')
def index():
    return send_from_directory('.', 'index.html')

@app.route('/message')
def message():
    msg = os.environ.get("DEPLOY_MESSAGE", "Default DevOps Message")
    return msg

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
