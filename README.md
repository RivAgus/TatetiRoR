# TICTACTTOE BACKEND - Advanced programming (programación avanzada)

![RubyOnRails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

## API documentation

### MODELS

- Player

- Game

### ALL ENDPOINTS

-post '/players'

- get '/players'

- get '/players/:id'

- get '/players/:id/name'

- post '/games' 

- put '/games/:id/join'

- get '/games/:id' 

- put '/games/:id' 


### PLAYERS ENDPOINTS

#### post '/players'

Create a player

#### get '/players'

Get all the players

#### get '/players/:id'

Show a player information (token included)

#### get '/players/:id/name'

Show the players name (useful when you don't want to access this players token)

### GAMES ENDPOINTS

#### post '/games' 

Creates a game

#### put '/games/:id/join'

Join a game

#### get '/games/:id' 

Show all the data from a game. 

#### put '/games/:id' 

Updates a game. Useful when you want to set plays a player did.