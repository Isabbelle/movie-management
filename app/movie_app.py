import json 

from flask import Flask   
#flask is a module of python. 
from flask_mysqldb import MySQL
  

app = Flask ("MovieApp")#in this variable we extend the class of the flask module "Flask" which implements WSGI what you see is what you get. this is how you start the app. our app variable is holding Flask. once u have the app open you have to define the roots. 

app.config["MYSQL_HOST"]= "127.0.0.1" 
# then we define the user, use a user when we ran the mysql with docker the first time 
app.config["MYSQL_USER"] = "root"
#!!!!!!!!!!!!normaly we dont define passwords in config files!!!!!!!!!!!
app.config["MYSQL_PASSWORD"] ="my-password"
app.config["MYSQL_DB"] ="movies_db"

#Example of route. github.com is the hostname but the root is the part after the slash. that s what we're goin to define. 
#think of react, when I used to define the root of the page "homepage" and then other pages that open up
mysql = MySQL(app) #as an argument needs to provide the flask app, we need to define app




@app.route('/') #main route/decorator = feature of python to change the behaviour of the function
#we define a route  by defining a function
def hello_world():
    return "<p>Hello World!</p>"
    #this is what going to be our minimalistic flask app
    #flask is different from python because we can't run it normally 
    #so we need to specify what we want to run it in an entry point of the python script

#this entry point is defined like this:
@app.route("/movies-table/")
def list_movie_table():                            #cursor= working with all the relational databases is the property of the connection where we are able to manipu;ate the data
    cursor = mysql.connection.cursor()            
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)                    #using the cursor execute the sql statement
    data = cursor.fetchall()                 #get everything from exected query .fetchall()
    cursor.close()    #should close the connection 
    return json.dumps(data) 

#Internal Server Error
#The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application.
# we defined a query but we didnt define the data base that we want to "querry" see line 10
if __name__=="__main__": 
    app.run(host="127.0.0.1")
    #you can also open python terminal and run flask app but this is more straight forward

#lets display the db and add the movie list :p, we can use the mysql module and we're going to import it 
#i want a specific route to list 

