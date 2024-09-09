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
      name: pokemon.name,
      species: pokemon.species,
      user_id: pokemon.user_id,
      pokeapi_id: pokemon.pokeapi_id,
      hunger: pokemon.hunger,
      fainted: pokemon.fainted
    }
  end
end
