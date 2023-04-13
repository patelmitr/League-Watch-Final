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

## Start the Docker Containers
1. To start the docker containers, we must activate our environment which should be created using Anaconda-Navigator.
1. To activate the environment we use the command "conda activate <environment-name>".
1. This will then start the docker containers. 
1. To run the application we must use the command "docker compose up" in the terminal.
1. This will then start our application to be accessed locally.
1. To then access the application, go to a browser and go to "localhost:8080" and it should open up the appsmith page.
