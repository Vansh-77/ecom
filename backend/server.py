from flask import Flask , request
import mysql.connector as sqlc

app = Flask(__name__)

@app.route("/")
def home():
    return {"message":"server is up and running..."}

@app.route("/add_to_cart" , methods = ["POST"])
def add_to_cart():
    data = request.json
    try :
        connection = sqlc.connect(host = "localhost",user= "vansh",password = "root",database = "ecommerce")  
        cursor = connection.cursor()
        cursor.execute(f"insert into cart values({data['user_id']} , {data['product_id']})")
        cursor.execute(f"select * from cart where user_id = {data['user_id']}")
        d = cursor.fetchall()
        connection.commit()
        return {"message":"product added to the cart","response":d}
    except:
        return {"message":"error connecting to the server","response":None} 
       

@app.route("/cart",methods = ["POST"])
def showcart():
    data  = request.json
    try:
        connection = sqlc.connect(host = "localhost",user= "vansh",password = "root",database = "ecommerce")  
        cursor = connection.cursor()
        cursor.execute(f"select * from cart where user_id = {data['user_id']}")
        d = cursor.fetchall()
        connection.commit()
        return {"message":"query executed successfully","response":d}
    except:
        return {"message":"error connecting to the server","response":None} 
@app.route("/login" , methods = ["POST"])
def login():
    data = request.json
    
    return {}

if __name__ == "__main__":
    app.run(host="localhost")

