from flask import Flask, jsonify

app = Flask(__name__)

# Données simulées
user_stats = {
    "total_users": 3,
    "active_users": 2,
    "new_users_today": 1
}

@app.route("/analytics/stats", methods=["GET"])
def stats():
    return jsonify(user_stats)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
