from flask import Flask, jsonify
import math

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Yemi's Automated AWS-based Deployment project with CodePipeline :)"})

@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200

@app.route('/stress')
def stress():
    # Do CPU-intensive work
    result = 0
    for i in range(1, 100000):
        result += math.sqrt(i) * math.sin(i)
    return jsonify({"result": result})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)