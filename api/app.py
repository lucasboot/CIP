#!/usr/bin/python3
from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from os import environ

DB_HOST = "172.17.0.3"
DB_NAME = "CIP"
DB_USER = "root"
DB_PASSWORD = "edu123"
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
    select_query = "SELECT * FROM Pet"
    return run_select_query(select_query)

@app.route('/get_users', methods=['GET'])
def get_user():
    select_query = "SELECT * FROM USUARIO "
    return run_select_query(select_query)

@app.route('/get_user', methods=['GET'])
def get_people_count_per_collector():
    request_data = request.get_json()
    cpf_user = request_data['CPF']
    select_query = "SELECT * FROM USUARIO WHERE CPF = \'"+cpf_user+"\'"
    return run_select_query(select_query)

@app.route('/add_user', methods=['POST'])
def add_user():
    print('Add user called!')
    print('Request' + str(request.data))
    insert_query = """INSERT INTO USUARIO VALUES(%s, %s, %s, %s, %s, %s)"""
    request_data = request.get_json()
    val = (request_data['CPF'],request_data['nome'],request_data['email'],request_data['telefone'],request_data['endereco'],request_data['senha'])
    return run_insert_query(insert_query, val, 'USUARIO')

@app.route('/add_dono_de_pet', methods=['POST'])
def add_dono_de_pet():
    print('Add dono de pet called!')
    print('Request' + str(request.data))
    insert_query = """INSERT INTO USUARIO VALUES(%s, %s, %s, %s, %s, %s)"""
    insert__dono_de_pet = """INSERT INTO Dono_de_Pet VALUES(%s)"""
    request_data = request.get_json() 
    val = (request_data['CPF'],request_data['nome'],request_data['email'],request_data['telefone'],request_data['endereco'],request_data['senha'])
    print(run_insert_query(insert_query, val, 'USUARIO'))
    val_pk = [(request_data['CPF'])]
    return run_insert_query(insert__dono_de_pet, val_pk, 'Dono_de_Pet')

@app.route('/add_pet', methods=['POST'])
def add_pet():
    print('Add dono de pet called!')
    print('Request' + str(request.data))
    insert_query = """INSERT INTO Pet VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"""
    request_data = request.get_json() 
    val = (request_data['codigo_identificador'],request_data['nome'],request_data['idade'],request_data['altura'],request_data['foto_pet'],request_data['nascimento'],request_data['falecimento'],request_data['raca'],request_data['peso'],request_data['perdido'],request_data['codigo_Dono_de_Pet'])
    return run_insert_query(insert_query, val, 'Pet')

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
