from tkinter import *
from datetime import datetime
from time import time
import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["DB"]
message_room_col = mydb["message_room"]

root = Tk()
root.title("Chat")

sender_frame = Frame(root, width=400, height=50)
sender_frame.pack()

sender_label = Label(sender_frame, text="Sender", width=5)
sender_label.pack(side = LEFT)

sender_entry = Entry(sender_frame, bg='gray', width=8)
sender_entry.pack(side = RIGHT)


text_frame = Frame(root, width=400, height=500)
text_frame.pack()

scrollbar = Scrollbar(text_frame)
scrollbar.pack( side = RIGHT, fill = Y )

text_plane = Text(text_frame, yscrollcommand = scrollbar.set)
text_plane.pack()

entry_frame = Frame(root, width=400, height=50)
entry_frame.pack()

reciever_label = Label(entry_frame, text="Reciever", width=5)
reciever_label.pack(side = LEFT)

reciever_entry = Entry(entry_frame, bg='gray', width=8)
reciever_entry.pack(side = LEFT)

message_entry = Entry(entry_frame, bg='gray', width=25)
message_entry.pack(side = LEFT)

#####################################################################

def get_student_tutor():
    get_reciever_entry = reciever_entry.get()
    get_sender_entry = sender_entry.get()

    if (".t" not in get_reciever_entry or ".s" not in get_sender_entry) and (".s" not in get_reciever_entry or ".t" not in get_sender_entry):
        return None, None, None
    
    reciever, reciever_status = get_reciever_entry.split('.')
    sender, sender_status = get_sender_entry.split('.')

    if reciever_status == 's' and sender_status == 't':
        tutor = sender
        student = reciever
        sender = "t"
    else :
        tutor = reciever
        student = sender
        sender = "s"

    return tutor, student, sender

def button_callback():
    text = message_entry.get()

    tutor, student, sender = get_student_tutor()
    
    query = { 
            "tutor_id": tutor, 
            "student_id": student
    }

    message  = {
            "time" : datetime.now(),
            "text" : text,
            "sender" : sender
        }

    update_count = message_room_col.update_one(query, {"$push":{"message": message}}).matched_count
    
    if update_count == 0 :
        query['message'] = [message]
        print(message_room_col.insert_one(query))
    message_entry.delete(0, 'end')
#####################################################################
button = Button(entry_frame, text="Send", width=5, command = button_callback)
button.pack(side = RIGHT)

#####################################################################

def fetching(index, previous_tutor, previous_student):

    tutor, student, _ = get_student_tutor()
    if previous_tutor!= tutor or previous_student != student :
        text_plane.delete("1.0", END)
        index = 0

    if tutor != None and student != None :  
        query = { 
            "tutor_id": tutor, 
            "student_id": student
        }

        doc = message_room_col.find_one(query)
        if doc != None:
            while index <= len(doc['message'])-1:
                sender = doc['message'][index]['sender'] 
                time =  doc['message'][index]['time'] 
                text = doc['message'][index]['text'] 
                if sender == 's' : sender = student
                else : sender = tutor

                text_plane.insert(END, "Sender : "+sender+" At :"+str(time.strftime("%m/%d/%Y, %H:%M:%S"))+"\n")
                text_plane.insert(END, "Message : "+text+"\n")
                index += 1

    root.after(100, fetching, index, tutor, student)

fetching(0, None, None)

######################################################################
root.mainloop()