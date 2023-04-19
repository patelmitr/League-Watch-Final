from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


players = Blueprint('players', __name__)

# Get all players from the DB
@players.route('/players', methods=['GET'])
def get_players():
    cursor = db.get_db().cursor()
    cursor.execute('select first_name, last_name, salary, team_id, player_id, player_number, position, points, assists, steals, blocks, rebounds, turnovers, games_played from Player')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    # the_response = make_response(jsonify(json_data))
    # the_response.status_code = 200
    # the_response.mimetype = 'application/json'
    #return the_response
    return jsonify(json_data)

# Get player detail for player with particular playerID
@players.route('/players/<playerID>', methods=['GET'])
def get_specificPlayer(playerID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Player where player_id = {0}'.format(playerID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player detail for player with particular playerID
@players.route('/players/getAllplayerID', methods=['GET'])
def get_allPlayerID():
    cursor = db.get_db().cursor()
    cursor.execute('select player_id as label, player_id as value from Player')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
        # json_data.append(dict(zip("value", row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player detail for players with particular number of points
@players.route('/players/points=<points>', methods=['GET'])
def get_points(points):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Player where points = {0}'.format(points))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player detail for players with particular number of assists
@players.route('/players/assists=<assists>', methods=['GET'])
def get_assists(assists):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Player where assists = {0}'.format(assists))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player detail for players with particular number of steals
@players.route('/players/steals=<steals>', methods=['GET'])
def get_steals(steals):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Player where steals = {0}'.format(steals))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player detail for players with particular number of blocks
@players.route('/players/blocks=<blocks>', methods=['GET'])
def get_blocks(blocks):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Player where blocks = {0}'.format(blocks))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player detail for players with particular number of rebounds
@players.route('/players/rebounds=<rebounds>', methods=['GET'])
def get_rebounds(rebounds):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Player where rebounds = {0}'.format(rebounds))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#POST a player in the DB
@players.route('/players', methods=['POST'])
def add_new_product():
    # access json data from, request object.
    current_app.logger.info('Processing form data')
    req_data = request.get_json()
    current_app.logger.info(req_data)

    first_name = req_data ['first_name']
    last_name = req_data['last_name']
    salary = req_data['salary']
    team_id = req_data ['team_id']
    player_id = req_data['player_id']
    player_number = req_data['player_number']
    position = req_data ['position']
    points = req_data['points']
    assists = req_data['assists']
    steals = req_data ['steals']
    blocks = req_data['blocks']
    rebounds = req_data['rebounds']
    turnovers = req_data['turnovers']
    games_played = req_data['games_played']

    # construct the insert statement
    insert_stmt = 'INSERT INTO Player(first_name, last_name, salary, team_id, player_id, player_number, position, points, assists, steals, blocks, rebounds, turnovers, games_played) VALUES ("'
    insert_stmt += first_name + '", "'
    insert_stmt += last_name + '", "'
    insert_stmt += str(salary) + '", "'
    insert_stmt += str(team_id) + '", "'
    insert_stmt += str(player_id) + '", "'
    insert_stmt += str(player_number) + '", "'
    insert_stmt += str(position) + '", "'
    insert_stmt += str(points) + '", "'
    insert_stmt += str(assists) + '", "'
    insert_stmt += str(steals) + '", "'
    insert_stmt += str(blocks) + '", "'
    insert_stmt += str(rebounds) + '", "'
    insert_stmt += str(turnovers) + '", "'
    insert_stmt += str(games_played) + '")'

    current_app.logger.info(insert_stmt)

    # execute the query
    cursor = db.get_db().cursor()
    cursor.execute(insert_stmt)
    db.get_db().commit()
    return 'Success!'

# Put a player in the DB
@players.route('/players/put=<playerID>', methods=['PUT'])
def put_player(playerID):
    # access json data from, request object.
    current_app.logger.info('Processing form data')
    req_data = request.get_json()
    current_app.logger.info(req_data)

    first_name = req_data ['first_name']
    last_name = req_data['last_name']
    salary = req_data['salary']
    team_id = req_data ['team_id']
    player_number = req_data['player_number']
    position = req_data ['position']
    points = req_data['points']
    assists = req_data['assists']
    steals = req_data ['steals']
    blocks = req_data['blocks']
    rebounds = req_data['rebounds']
    turnovers = req_data['turnovers']
    games_played = req_data['games_played']

    # construct the update statement
    update_stmt = 'update Player set first_name = \''
    update_stmt += first_name + '\', '
    update_stmt += 'last_name = \''
    update_stmt += last_name + '\', '
    update_stmt += 'salary = '
    update_stmt += str(salary) + ', '
    update_stmt += 'team_id = '
    update_stmt += str(team_id) + ', '
    update_stmt += 'player_number = '
    update_stmt += str(player_number) + ', '
    update_stmt += 'position = \''
    update_stmt += position + '\', '
    update_stmt += 'points = '
    update_stmt += str(points) + ', '
    update_stmt += 'assists = '
    update_stmt += str(assists) + ', '
    update_stmt += 'steals = '
    update_stmt += str(steals) + ', '
    update_stmt += 'blocks = '
    update_stmt += str(blocks) + ', '
    update_stmt += 'rebounds = '
    update_stmt += str(rebounds) + ', '
    update_stmt += 'turnovers = '
    update_stmt += str(turnovers) + ', '
    update_stmt += 'games_played = '
    update_stmt += str(games_played)
    update_stmt += ' where player_id = ' + str(playerID)

    # execute the query
    cursor = db.get_db().cursor()
    cursor.execute(update_stmt)
    
    return "Success"

# Delete a player in the DB
@players.route('/players/delete=<playerID>', methods=['DELETE'])
def delete_player(playerID):
    # access json data from, request object.
    current_app.logger.info('Processing form data')

    # construct the delete statement
    delete_stmt = 'delete from Player where player_id = '
    delete_stmt += playerID 

    # execute the query
    cursor = db.get_db().cursor()
    cursor.execute(delete_stmt)

    return "Success"