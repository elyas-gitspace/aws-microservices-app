from flask import Flask, jsonify, request

app = Flask(__name__)

notifications = []

@app.route("/notifications/send", methods=["POST"])
def send_notification():
    data = request.json
    notifications.append(data)
    print(f"Notification sent: {data}")
    return jsonify({"status": "sent", "notification": data}), 201

@app.route("/notifications", methods=["GET"])
def get_notifications():
    return jsonify(notifications)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
