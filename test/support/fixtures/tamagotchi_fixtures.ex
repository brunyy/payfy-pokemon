defmodule PayfyPokemon.TamagotchiFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PayfyPokemon.Tamagotchi` context.
  """

  @doc """
  Generate a pokemon.
  """
  def pokemon_fixture(attrs \\ %{}) do
    {:ok, pokemon} =
      attrs
      |> Enum.into(%{
        hunger: 42,
        name: "some name",
        pokeapi_id: "some pokeapi_id",
        status: "some status"
      })
      |> PayfyPokemon.Tamagotchi.create_pokemon()

    pokemon
  end
end
