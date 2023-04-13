from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


leagueCommissioner = Blueprint('leagueCommissioner', __name__)

# Get all leagueCommissioner from the DB
@leagueCommissioner.route('/leagueCommissioner', methods=['GET'])
def get_leagueCommissioner():
 cursor = db.get_db().cursor()
 cursor.execute('select first_name, last_name, tenure, salary, league_commissioner_id, league_name from leagueCommissioner')
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response

# Get leagueCommissioner detail for leagueCommissioner with particular league_commissioner_id
@leagueCommissioner.route('/leagueCommissioner/<leagueCommissionerID>', methods=['GET'])
def get_specificLeagueCommissioner(leagueCommissionerID):
 cursor = db.get_db().cursor()
 cursor.execute('select * from leagueCommissioner where leagueCommissioner_id = {0}'.format(leagueCommissionerID))
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response

# Get leagueCommissioner detail for leagueCommissioner with particular first_name
@leagueCommissioner.route('/leagueCommissioner/<first_name>', methods=['GET'])
def get_firstNameCommissioner(first_name):
 cursor = db.get_db().cursor()
 cursor.execute('select * from leagueCommissioner where first_name = {0}'.format(first_name))
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response

# Get leagueCommissioner detail for leagueCommissioner with particular last_name
@leagueCommissioner.route('/leagueCommissioner/<last_name>', methods=['GET'])
def get_customer(last_name):
 cursor = db.get_db().cursor()
 cursor.execute('select * from leagueCommissioner where last_name = {0}'.format(last_name))
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response

# Get leagueCommissioner detail for leagueCommissioner with particular tenure
@leagueCommissioner.route('/leagueCommissioner/<tenure>', methods=['GET'])
def get_customer(tenure):
 cursor = db.get_db().cursor()
 cursor.execute('select * from leagueCommissioner where tenure = {0}'.format(tenure))
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response

# Get leagueCommissioner detail for leagueCommissioner with particular salary
@leagueCommissioner.route('/leagueCommissioner/<salary>', methods=['GET'])
def get_customer(salary):
 cursor = db.get_db().cursor()
 cursor.execute('select * from leagueCommissioner where salary = {0}'.format(salary))
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response

# Get leagueCommissioner detail for leagueCommissioner with particular league_name
@leagueCommissioner.route('/leagueCommissioner/<league_name>', methods=['GET'])
def get_customer(league_name):
 cursor = db.get_db().cursor()
 cursor.execute('select * from leagueCommissioner where league_name = {0}'.format(league_name))
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response

#POST a leagueCommissioner in the DB
@leagueCommissioner.route('/leagueCommissioner', methods=['POST'])
def add_new_product ():
 # access json data from, request object.
 current_app.logger.info('Processing form data')
 req_data = request.get_json()
 current_app.logger.info(req_data)

 first_name = req_data ['first _name']
 last_name = req_data['last_name']
 tenure = req_data['tenure']
 salary = req_data['salary']
 leagueCommissioner_id = req_data['leagueCommissioner_id']
 league_name = req_data['league_name']

 # construct the insert statement
 insert_stmt = 'INSERT INTO leagueCommissioner (first_name, last_name, tenure, salary, leagueCommissioner_id, league_name) VALUES ("'
 insert_stmt += first_name + '", "' 
 insert_stmt += last_name + '", "'
 insert_stmt += str(tenure) + '", "'
 insert_stmt += str(salary) + '", "'
 insert_stmt += str(leagueCommissioner_id) + '", "'
 insert_stmt += league_name + ')'

 current_app.logger.info(insert_stmt)

 # execute the query
 cursor = db.get_db().curser()
 cursor.execute(insert_stmt)
 db.get_db().commit()
 return 'Success!'

#TODO
# Put a leagueCommissioner in the DB
@leagueCommissioner.route('/leagueCommissioner', methods=['PUT'])
def get_customer(leagueCommissionerID):
 cursor = db.get_db().cursor()
 cursor.execute('insert first_name, last_name, salary, team_id, leagueCommissioner_id, leagueCommissioner_number, position, points, assists, steals, blocks, rebounds, turnovers, games_played from leagueCommissioner')
 row_headers = [x[0] for x in cursor.description]
 json_data = []
 theData = cursor.fetchall()
 for row in theData:
  json_data.append(dict(zip(row_headers, row)))
 the_response = make_response(jsonify(json_data))
 the_response.status_code = 200
 the_response.mimetype = 'application/json'
 return the_response