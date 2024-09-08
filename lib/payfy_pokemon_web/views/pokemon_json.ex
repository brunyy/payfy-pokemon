defmodule PayfyPokemonWeb.PokemonJSON do
  alias PayfyPokemon.Tamagotchi.Pokemon

  @doc """
  Renders a list of pokemons.
  """
  def index(%{pokemons: pokemons}) do
    %{data: for(pokemon <- pokemons, do: data(pokemon))}
  end

  @doc """
  Renders a single pokemon.
  """
  def show(%{pokemon: pokemon}) do
    %{data: data(pokemon)}
  end

  defp data(%Pokemon{} = pokemon) do
    %{
      id: pokemon.id,
      name: pokemon.name,
      hunger: pokemon.hunger,
      status: pokemon.status,
      pokeapi_id: pokemon.pokeapi_id
    }
  end
end
