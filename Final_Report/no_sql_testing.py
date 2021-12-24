import pymongo
from time import time

myclient = pymongo.MongoClient("mongodb://localhost:27017/")

mydb = myclient["DB"]
mycol = mydb["message_room"]

'''mydict = { 
    "tutor": "Tutor1", 
    "student": "Student1",
    "message":[] 
    }'''

#x = mycol.insert_one(mydict)

myquery = { 
            "tutor": "Tutor1", 
            "student": "Student1"
        }
newvalues = { "$push": 
                { "message": 
                    { 
                        "timestamp" : "1234567",
                        "sender" : "s",
                        "text":"สวัสดีครับ", 
                    } 
                } 
            }
temp = mycol.find_one(myquery)
print(temp)

print(mydb.list_collection_names())
print(type(time()))