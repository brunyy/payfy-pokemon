# Payfy Backend Test

This is a REST API built with Elixir and Phoenix that manages users and their Pokémon teams. It interacts with the [PokeAPI](https://pokeapi.co/) and includes functionalities such as creating users and Pokémon, and feeding and reviving Pokémon.

Public api for testing: https://payfy-pokemon-latest.onrender.com/api/

## Features
- Register users
- Create and manage Pokémon
- Feed and revive Pokémon
- Schedule automated tasks (using Quantum) to update all Pokémon hunger every minute by 1

## Requirements
- Elixir 1.14+
- Phoenix 1.7+
- SQLServer
- Docker (optional, for running the app in a container)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/brunyy/payfy-pokemon.git
    cd payfy_pokemon
    ```

2. Install dependencies:

    ```bash
    mix deps.get
    ```

3. Set up the database:
    - Database credentials must be provided under /config/. Then run:

    ```bash
    mix ecto.create
    mix ecto.migrate
    ```

4. Start the Phoenix server:

    ```bash
    mix phx.server
    ```

    The app will be running at `http://localhost:4000`.

5. Else, with Docker locally:
        
      ```bash
      docker build --no-cache  -t payfy_pokemon:latest .
      docker run -d -p 4000:4000 --name payfy_pokemon payfy_pokemon:latest
      ```

## API Endpoints

### Users

#### Create an User
- **POST** `/users`
- Creates a new user.

Example Request Body:
```json
{
  "user": {
      "name": "Bru",
      "email": "bruna@pokemon.com"
  }
}
```

#### Get an User 
- **GET** `/users/{id}`
- Gets an existing user and their team.

Example Response:
```json
{
    "id": 1,
    "name": "Bru",
    "email": "bruna@pokemon.com",
    "team": [
        {
            "name": "Mimi",
            "species": "bulbasaur",
            "user_id": 1,
            "pokeapi_id": 1,
            "hunger": 8,
            "fainted": false
        },
        {
            "name": "Gu",
            "species": "ivysaur",
            "user_id": 1,
            "pokeapi_id": 2,
            "hunger": 25,
            "fainted": false
        }
    ]
}
````

#### Updates an User
- **PUT** `/users`
- Updates an user's data.

Example Request Body:
```json
{
    "user": {
        "name": "Bruna"
    }
}
```

### Pokémon

#### Create a Pokémon
- **POST** `/pokemons`
- Creates a new pokémon.

Example Request Body:
```json
{
    "pokemon": {
        "name": "Gu",
        "pokeapi_id": 2,
        "user_id": 1
    }
}
```

#### Get a Pokémon 
- **GET** `/pokemons/{id}`
- Gets an existing pokémon.

Example Response:
```json
{
    "name": "Mimi",
    "species": "bulbasaur",
    "user_id": 1,
    "pokeapi_id": 1,
    "hunger": 12,
    "fainted": false
}
```

#### Feed a Pokémon 
- **`POST`** `/pokemons/{id}/feed`
- Feeds an existing pokémon, reduce it's hunger by 20.

#### Revive a Pokémon 
- **`POST`** `/pokemons/{id}/feed`
- Revives an existing fainted pokémon, sets its hunger to 0.

#### Update a Pokémon's name
- **PUT** `/pokemons/{id}`
- Updates an existing pokémon.

Example Request Body:
```json
{
    "pokemon": {
        "name": "Lu"
    }
}
``` 

#### Deletes a Pokémon
- **DELETE** `/pokemons/{id}`
- Removes a pokémon from a player's team.





