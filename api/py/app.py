import ssl, json, pprint

from pymongo import MongoClient
from flask import Flask, jsonify, request

from bson import json_util

app = Flask(__name__)
client = MongoClient('mongodb://127.0.0.1:27017')

db = client.health
collection = db.diseases


@app.route('/')
def index():
    curs = collection.find( {"$and": [
            {"bodyPart_reported": {"$in": request.json['bodyPart']} },
            {"symptoms": {"$in": request.json['sympt']}} 
            ]
        })
    listAll = []
    for result in curs:
        listAll.append(
        {'result': { 
        'name_sci': result['name_sci'],
        'name':     result['name_simple'],
        'desc':     result['description'],
        'affected': result['bodyPartAffected'],
        'symptoms': result['symptoms']
        }}
        )
    listAll.append({"result_count": curs.count()})
    return jsonify(listAll)

