from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


leagueCommissioner = Blueprint('leagueCommissioner', __name__)

# Get all leagueCommissioner from the DB
@leagueCommissioner.route('/leagueCommissioner', methods=['GET'])
def get_leagueCommissioner():
 cursor = db.get_db().cursor()
 cursor.execute('select first_name, last_name, tenure, salary, league_commissioner_id, league_name from League_Commissioner')
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
 cursor.execute('select * from League_Commissioner where league_commissioner_id = {0}'.format(leagueCommissionerID))
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
@leagueCommissioner.route('/leagueCommissioner/firstname=<first_name>', methods=['GET'])
def get_firstNameCommissioner(first_name):
 cursor = db.get_db().cursor()
 cursor.execute('select * from League_Commissioner where first_name = {0}'.format(first_name))
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
@leagueCommissioner.route('/leagueCommissioner/lastname=<last_name>', methods=['GET'])
def get_lastnameCommissioner(last_name):
 cursor = db.get_db().cursor()
 cursor.execute('select * from League_Commissioner where last_name = {0}'.format(last_name))
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
@leagueCommissioner.route('/leagueCommissioner/tenure=<tenure>', methods=['GET'])
def get_tenure(tenure):
 cursor = db.get_db().cursor()
 cursor.execute('select * from League_Commissioner where tenure = {0}'.format(tenure))
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
@leagueCommissioner.route('/leagueCommissioner/salary=<salary>', methods=['GET'])
def get_salary(salary):
 cursor = db.get_db().cursor()
 cursor.execute('select * from League_Commissioner where salary = {0}'.format(salary))
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
@leagueCommissioner.route('/leagueCommissioner/leaguename=<league_name>', methods=['GET'])
def get_leaguename(league_name):
 cursor = db.get_db().cursor()
 cursor.execute('select * from League_Commissioner where league_name = {0}'.format(league_name))
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
def post_leagueCommissioner ():
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
 insert_stmt = 'INSERT INTO League_Commissioner (first_name, last_name, tenure, salary, leagueCommissioner_id, league_name) VALUES ("'
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

# Put a leagueCommissionerID in the DB
@leagueCommissioner.route('/leagueCommissioner/put=<leagueCommissionerID>', methods=['PUT'])
def put_player(leagueCommissionerID):
# access json data from, request object.
current_app.logger.info('Processing form data')
req_data = request.get_json()
current_app.logger.info(req_data)

first_name = req_data ['first_name']
last_name = req_data['last_name']
tenure = req_data['tenure']
salary = req_data['salary']
league_commissioner_id = req_data ['league_commissioner_id']
league_name = req_data['league_name']

# construct the update statement
update_stmt = 'update League_Commissioner set first_name = \''
update_stmt += first_name + '\', '
update_stmt += 'last_name = \''
update_stmt += last_name + '\', '
update_stmt += 'tenure = '
update_stmt += str(tenure) + ', '
update_stmt += 'salary = '
update_stmt += str(salary) + ', '
update_stmt += 'league_commissioner_id = '
update_stmt += str(league_commissioner_id) + ', '
update_stmt += 'league_name = \''
update_stmt += league_name + '\''
update_stmt += ' where league_commissioner_id = ' + str(league_commissioner_id)

# execute the query
cursor = db.get_db().cursor()
cursor.execute(update_stmt)

return "Success"

# Delete a player in the DB
@leagueCommissioner.route('/leagueCommissioner/delete=<leagueCommissionerID>', methods=['DELETE'])
def delete_player(leagueCommissionerID):
# access json data from, request object.
current_app.logger.info('Processing form data')

# construct the delete statement
delete_stmt = 'delete from League_Commissioner where league_commissioner_id = \''
delete_stmt += leagueCommissionerID + '\';'

# execute the query
cursor = db.get_db().cursor()
cursor.execute(delete_stmt)

return "Success"