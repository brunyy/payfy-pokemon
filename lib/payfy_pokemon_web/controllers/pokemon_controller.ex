defmodule PayfyPokemonWeb.PokemonController do
  use PayfyPokemonWeb, :controller

  alias PayfyPokemon.Tamagotchi
  alias PayfyPokemon.Tamagotchi.Pokemon

  action_fallback PayfyPokemonWeb.FallbackController

  def index(conn, _params) do
    pokemons = Tamagotchi.list_pokemons()
    render(conn, :index, pokemons: pokemons)
  end

  def create(conn, %{"pokemon" => pokemon_params}) do
    with {:ok, %Pokemon{} = pokemon} <- Tamagotchi.create_pokemon(pokemon_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pokemons/#{pokemon}")
      |> render(:show, pokemon: pokemon)
    end
  end

  def show(conn, %{"id" => id}) do
    pokemon = Tamagotchi.get_pokemon!(id)
    render(conn, :show, pokemon: pokemon)
  end

  def update(conn, %{"id" => id, "pokemon" => pokemon_params}) do
    pokemon = Tamagotchi.get_pokemon!(id)

    with {:ok, %Pokemon{} = pokemon} <- Tamagotchi.update_pokemon(pokemon, pokemon_params) do
      render(conn, :show, pokemon: pokemon)
    end
  end

  def delete(conn, %{"id" => id}) do
    pokemon = Tamagotchi.get_pokemon!(id)

    with {:ok, %Pokemon{}} <- Tamagotchi.delete_pokemon(pokemon) do
      send_resp(conn, :no_content, "")
    end
  end
end
