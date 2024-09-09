defmodule PayfyPokemon.TamagotchiFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PayfyPokemon.Tamagotchi` context.
  """

  @doc """
  Generate a pokemon.
  """
  def pokemon_fixture(attrs \\ %{}) do
    default_attrs = %{
      name: "some name",
      pokeapi_id: 1,
      hunger: 42,
      species: "bulbasaur",
      fainted: false,
      user_id: 1
    }

    # Use Map.merge to combine the default attributes with the passed attrs map
    attrs
    |> Map.merge(default_attrs)
    |> PayfyPokemon.Tamagotchi.create_pokemon()
    |> case do
      {:ok, pokemon} -> pokemon
      {:error, changeset} ->
        IO.inspect(changeset.errors, label: "Failed to create pokemon fixture with errors")
        raise "Failed to create pokemon fixture"
    end
  end
end
