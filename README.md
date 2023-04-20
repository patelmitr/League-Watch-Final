# League Watch
League Watch is a league management application that consolidates all internal and external operations for the National Basketball Association and provides various “involved” parties with a unified platform for all information and administration needs. Currently, there is no all-in-one offering for members of the league to dissect different information and make decisions regarding their organization. For example, members of the league can access detailed data about a particular team or player but it may require searching the web and referencing numerous different sources such as Basketball reference, NBA, ESPN, and Yahoo Sports. From an administrative perspective, it is not exactly known what each team utilizes to manage their team logistics or if each organization uses a different tool, but from a league commissioner standpoint having the solution be standardized and consistent would simplify many different processes. Our solution, League Watch, will allow for all the main parties interested and involved with the league to be able to perform the functions that are deemed appropriate in a quick and efficient manner. Accessing different data from previous seasons in terms of top 5 teams in each conference, number of wins of each team, number of points for particular players, best 3-point shooters statistically, trades between teams, and the like should all be feasible tasks from our application that can benefit various user personas for their unique purposes. 

This repo contains a setup for spinning up 3 Docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API
1. A Local AppSmith Server

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 
1. This will then start our application to be accessed locally.
1. To then access the application, go to a browser and go to "localhost:8080" and it should open up the appsmith page.
1. From here we can use the functionality on the Appsmith website as designed in flask and the backend.

## Appsmith Functionality
The Appsmith has a few different functionalities that are made possible by the backend code and the data stored in the database. The data and backend are combined to create different routes from which can be accessed online through the browser via localhost:8080. These routes were accessed on Appsmith on four different pages, two pages for the Players persona and two for the League Commissioner persona. On these four pages are 1 POST, 1 PUT, and 1 DELETE route for each persona along with all the GET routes gathering data. The routes used on Appsmith and defined in the backend are:

### <u> Player </u>
#### GET
* localhost:8001/pl/players
* localhost:8001/pl/players/<playerID>
* localhost:8001/pl/players/getAllplayerID
* localhost:8001/pl/players/points=<points>
* localhost:8001/pl/players/assists=<assists>
* localhost:8001/pl/players/steals=<steals>
* localhost:8001/pl/players/blocks=<blocks>
* localhost:8001/pl/players/rebounds=<rebounds>

#### POST
* localhost:8001/pl/players

#### PUT
* localhost:8001/pl/players/put=<playerID>

#### DELETE
* localhost:8001/pl/players/delete=<playerID>

### <u> League Commissioner </u>
#### GET
* localhost:8001/l/leagueCommissioner
* localhost:8001/l/leagueCommissioner/leagueCommissionerID
* localhost:8001/l/leagueCommissioner/firstname=<first_name>
* localhost:8001/l/leagueCommissioner/lastname=<last_name>
* localhost:8001/l/leagueCommissioner/leagueid=<leagueid>
* localhost:8001/l/leagueCommissioner/tenure=<tenure>
* localhost:8001/l/leagueCommissioner/salary=<salary>
* localhost:8001/l/leagueCommissioner/getAllLeagueCommissionerID

#### POST
* localhost:8001/l/leagueCommissioner

#### PUT
* localhost:8001/l/leagueCommissioner/put=<leagueCommissionerID>

#### DELETE
* localhost:8001/l/leagueCommissioner/delete=<leagueCommissionerID>
