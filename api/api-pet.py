#!/usr/bin/python3
from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from os import environ

DB_HOST = environ.get('DB_HOST')
DB_NAME = environ.get('DB_NAME')
DB_USER = environ.get('DB_USER')
DB_PASSWORD = environ.get('DB_PASSWORD')
if DB_PASSWORD is not None:
    print('###################################')
    print('These are the environment variables: DB_HOST='+DB_HOST+', DB_NAME='+DB_NAME+', DB_USER='+DB_USER+', DB_PASSWORD='+DB_PASSWORD)
    print('###################################')
else:
    print('###################################')
    print('No environment variable appeared!')
    print('###################################')


app = Flask(__name__)

@app.route('/get_pets', methods=['GET'])
def get_pets():
    select_query = "SELECT * FROM Pets"
    return run_select_query(select_query)

@app.route('/get_user', methods=['GET'])
def get_user():
    request_data = request.get_json()
    collectorCpf = request_data['CPF']
    select_query = "SELECT * FROM USUARIO WHERE CPF = \'"+collectorCpf+"\'"
    return run_select_query(select_query)

@app.route('/add_user', methods=['POST'])
def add_people_count():
    print('Add user called!')
    print('Request' + str(request.data))
    insert_query = """INSERT INTO USUARIO VALUES(%d, %s, %s, %d, %s, %s)"""
    request_data = request.get_json()
    val = (request_data['CPF'],request_data['nome'],request_data['email'],request_data['telefone'],request_data['endereco'],request_data['senha'])
    return run_insert_query(insert_query, val, 'USUARIO')   

@app.route('/add_people_recognized', methods=['POST'])
def add_ppl_recognized():
    request_data = request.get_json()
    name_ids = []
    print('Request data (json): '+str(request_data['value']))
    for name in request_data['value']:
        print(name)          
        name_ids.append(add_people(name))

    recog_id = add_recognized(request_data)   
    res = []
    for name_id in name_ids:
        insert_query = """INSERT IGNORE INTO PeopleRecognized (id_recognized, id_people) VALUES (%s, %s)"""    
        val = (recog_id, name_id)        
        res.append(run_insert_query(insert_query, val, 'PeopleRecognized'))

    return json.dumps(res)

def add_people(name):
    insert_query = """INSERT IGNORE INTO People (name) VALUES (%s)"""    
    val = (name,)
    return run_insert_query(insert_query, val, 'People')[1]   #returns id

def add_recognized(request_data):
    insert_query = """INSERT INTO Recognized (collector_id, timestamp) VALUES (%s, %s)"""
    val = (request_data['collector_id'],str(request_data['timestamp']))
    return run_insert_query(insert_query, val, 'Recognized')[1]   #returns id
    
def get_database_connection():
    return mysql.connector.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASSWORD)

def run_insert_query(query, values, table_name):
    connection = get_database_connection()
    res = ''
    id = None
    try:
        cursor = connection.cursor()
        cursor.execute(query, values)
        connection.commit()
        id = cursor.lastrowid
        if id is not None:
            res += 'Record with id('+str(id)+') inserted successfully into '+table_name+' table'
        else: 
            res += str(cursor.rowcount) + ' Record inserted successfully into '+table_name+' table'
        print(res)
        cursor.close()
    except mysql.connector.Error as error:
        res += "Failed to insert record into table {}".format(error)
        print(res)
    finally:
        if connection.is_connected():
            connection.close()
    return (res,id)

def run_select_query(query):
    connection = get_database_connection()
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        res = cursor.fetchall()
        for x in res:
            print(x)
        print(res)
        cursor.close()
    except mysql.connector.Error as error:
        res = "Failed to select from table {}".format(error)
        print(res)
    finally:
        if connection.is_connected():
            connection.close()
    return json.dumps(res)
