import os
from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

def connect_to_db():
    conn = psycopg2.connect(
        host=os.environ['DB_HOST'],
        database=os.environ['POSTGRES_DB'],
        user=os.environ['POSTGRES_USER'],
        password=os.environ['POSTGRES_PASSWORD']
    )
    return conn

@app.route('/')
def main_page():
    return 'Hello from main page!'

@app.route('/endpoint1')
def get_table1_data():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT * FROM endpoint1;")
    data = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(data)

@app.route('/endpoint2')
def get_table2_data():
    conn = connect_to_db()
    cur = conn.cursor()
    cur.execute("SELECT * FROM endpoint2;")
    data = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)