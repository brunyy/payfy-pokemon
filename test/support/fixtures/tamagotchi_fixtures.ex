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
          name: "some name",
          pokeapi_id: 1,
          hunger: 42,
          species: "bulbasaur",
          fainted: false,
          user_id: 1
        })
        |> PayfyPokemon.Tamagotchi.create_pokemon()

      pokemon
    end
  end
