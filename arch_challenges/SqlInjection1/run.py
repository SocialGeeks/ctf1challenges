#!/usr/bin/env python
from flask import Flask, request
from mysql import connector

app = Flask(__name__)


KEY="OneEqualsOne"
DB = {
    'user': 'haypp_hxar',
    'password': 'dtIwRdKa0T22zoPngQyl7Cf5gcgYPC',
    'host': 'localhost',
    'database': 'oroneisone'
}


def check_db(u, p):
    cnx = connector.connect(**DB)
    sql = cnx.cursor()

    try:
        sql.execute(
            "SELECT id from users where uname='{}' and passw='{}'".format(u, p)
        )
    except:
        return False

    for _id in sql:
        return True

    return False


def make_response(title, body):
    return """
    <html>
        <head>
            <style>
                label {{ width: 80px; display: inline-block; }}
                input {{ width: 120px; display: inline-block }}
                .error {{ color: darkred; }}
            </style>
        </head>
        <body>
            <h1>{0}</h1>
            <div>{1}</div>
        </body>
    </html>
    """.format(title, body)


@app.route('/', methods=['GET'])
def a(error=None):
    _message = "<span class='error'>{}</span><br /><br/ >".format(error) if error else ""
    return make_response(
        "Please login",
        """
        {}
        <form method='POST'>
        <label for='uname'>Username: </label><input type='text' name='uname' /><br />
        <label for='passw'>Password: </label><input type='text' name='passw' /><br />
        <br />
        <label></label><input type='submit' value="Login">
        </form>
        """.format(_message)
    )


@app.route('/', methods=['POST'])
def b():
    try:
        uname = request.form['uname']
        passw = request.form['passw']

    except KeyError:
        return make_response(
            "What are you trying to pull?",
            "Did you forget to type in your username or password?"
        )

    if check_db(uname, passw):
        return make_response(
            "Good work!",
            "Key: {}".format(KEY)
        )

    return a(error="Wrong username or password")


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
