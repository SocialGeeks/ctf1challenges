#!/usr/bin/env python
from flask import Flask, request
from mysql import connector

app = Flask(__name__)


KEY="UnionAllTheThings"
DB = {
    'user': 'haypp_hxar',
    'password': 'dtIwRdKa0T22zoPngQyl7Cf5gcgYPC',
    'host': 'localhost',
    'database': 'oroneisone'
}


def get_products():
    cnx = connector.connect(**DB)
    sql = cnx.cursor()

    _ret = []

    try:
        sql.execute(
            "SELECT id, name from products;"
        )

        for _id, _name in sql:
            yield _id, _name

    except:
        return

    finally:
        if cnx:
            cnx.close()


def get_product(i):
    cnx = connector.connect(**DB)
    sql = cnx.cursor()

    _ret = []

    try:
        _sql = "SELECT name, ppm from products where id = {};".format(i)
        print _sql
        sql.execute(_sql)

        for _name, _ppm in sql:
            yield _name, _ppm

    except:
        return

    finally:
        if cnx:
            cnx.close()


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
def a():
    _table = []

    for _id, _name in get_products():
        _table.append("<tr><td><a href='/product?id={}'>{}<a></td></td>".format(_id, _name))

    return make_response(
        "Please select a metal",
        "<table>{}</table>".format("".join(_table))
    )

@app.route('/product', methods=['GET'])
def b():
    try:
        _id = request.args['id']

    except:
        return make_response(
            "What are you trying to pull?",
            "Go back and click on a metal. That will do the trick."
        )

    _table = []

    _the_name = ''
    for _name, _ppm in get_product(_id):
        _the_name = _name
        _table.append("<tr><td>Mass abundance (parts per million)</td><td>{}</td></td>".format(_ppm))

    return make_response(
        _the_name,
        "<table>{}</table>".format("".join(_table))
    )


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
