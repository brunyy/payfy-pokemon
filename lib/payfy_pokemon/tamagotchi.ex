defmodule PayfyPokemon.Tamagotchi do
  @moduledoc """
  The Tamagotchi context.
  """

  import Ecto.Query, warn: false
  alias PayfyPokemon.Repo

  alias PayfyPokemon.Tamagotchi.Pokemon

  def update_all_hunger do
    Repo.transaction(fn ->
      from(p in Pokemon,
        where: p.hunger < 150,
        update: [inc: [hunger: 1]]
      )
      |> Repo.update_all([])

      from(p in Pokemon,
        where: p.hunger >= 150
      )
      |> Repo.update_all(set: [fainted: true])
    end)
  end

  def feed_pokemon(id) do
    Repo.transaction(fn ->
      pokemon = Repo.get!(Pokemon, id)

      if pokemon.fainted do
        raise "Pokemon #{pokemon.name} is fainted and can't be fed"
      end

      new_hunger = max(pokemon.hunger - 20, 0)
      updated_pokemon =
        pokemon
        |> Ecto.Changeset.change(hunger: new_hunger)
        |> Repo.update!()
      updated_pokemon
    end)
  end

  @doc """
  Returns the list of pokemons.

  ## Examples

      iex> list_pokemons()
      [%Pokemon{}, ...]

  """
  def list_pokemons do
    Repo.all(Pokemon)
  end

  @doc """
  Gets a single pokemon.

  Raises `Ecto.NoResultsError` if the Pokemon does not exist.

  ## Examples

      iex> get_pokemon!(123)
      %Pokemon{}

      iex> get_pokemon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pokemon!(id), do: Repo.get!(Pokemon, id)

  @doc """
  Creates a pokemon.

  ## Examples

      iex> create_pokemon(%{field: value})
      {:ok, %Pokemon{}}

      iex> create_pokemon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
def create_pokemon(attrs \\ %{}) do

  pokeapi_id = attrs["pokeapi_id"]
  case PayfyPokemon.PokeAPI.get_pokemon(pokeapi_id) do
    {:ok, pokemon_data} ->
      pokemon_species = pokemon_data["name"]

      new_attrs = Map.put(attrs, "species", pokemon_species)

      %Pokemon{}
      |> Pokemon.changeset(new_attrs)
      |> Repo.insert()

    {:error, _reason} ->
      {:error, "Failed to fetch Pokémon details from PokeAPI"}
  end
end

  @doc """
  Updates a pokemon.

  ## Examples

      iex> update_pokemon(pokemon, %{field: new_value})
      {:ok, %Pokemon{}}

      iex> update_pokemon(pokemon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pokemon(%Pokemon{} = pokemon, attrs) do
    pokemon
    |> Pokemon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pokemon.

  ## Examples

      iex> delete_pokemon(pokemon)
      {:ok, %Pokemon{}}

      iex> delete_pokemon(pokemon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pokemon(%Pokemon{} = pokemon) do
    Repo.delete(pokemon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pokemon changes.

  ## Examples

      iex> change_pokemon(pokemon)
      %Ecto.Changeset{data: %Pokemon{}}

  """
  def change_pokemon(%Pokemon{} = pokemon, attrs \\ %{}) do
    Pokemon.changeset(pokemon, attrs)
  end
end
