#import os
from flask import Flask, jsonify
import psycopg2
import yaml

app = Flask(__name__)

with open('./flask-app/values.yaml', 'r') as file:
    data = yaml.safe_load(file)

def connect_to_db():
    conn = psycopg2.connect(
        host=flask-app-postgresql,
        database=data['postgresql']['global']['postgresql']['auth']['database'],
        user=data['postgresql']['global']['postgresql']['auth']['username'],
        password=data['postgresql']['global']['postgresql']['auth']['password']
    )
    return conn

@app.route('/')
def main_page():
    return 'Hello from main page!'
    print (connect_to_db)

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
