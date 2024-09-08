defmodule PayfyPokemon.TamagotchiTest do
  use PayfyPokemon.DataCase

  alias PayfyPokemon.Tamagotchi

  describe "pokemons" do
    alias PayfyPokemon.Tamagotchi.Pokemon

    import PayfyPokemon.TamagotchiFixtures

    @invalid_attrs %{name: nil, status: nil, hunger: nil, pokeapi_id: nil}

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Tamagotchi.list_pokemons() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert Tamagotchi.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      valid_attrs = %{name: "some name", status: "some status", hunger: 42, pokeapi_id: "some pokeapi_id"}

      assert {:ok, %Pokemon{} = pokemon} = Tamagotchi.create_pokemon(valid_attrs)
      assert pokemon.name == "some name"
      assert pokemon.status == "some status"
      assert pokemon.hunger == 42
      assert pokemon.pokeapi_id == "some pokeapi_id"
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tamagotchi.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      update_attrs = %{name: "some updated name", status: "some updated status", hunger: 43, pokeapi_id: "some updated pokeapi_id"}

      assert {:ok, %Pokemon{} = pokemon} = Tamagotchi.update_pokemon(pokemon, update_attrs)
      assert pokemon.name == "some updated name"
      assert pokemon.status == "some updated status"
      assert pokemon.hunger == 43
      assert pokemon.pokeapi_id == "some updated pokeapi_id"
    end

    test "update_pokemon/2 with invalid data returns error changeset" do
      pokemon = pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = Tamagotchi.update_pokemon(pokemon, @invalid_attrs)
      assert pokemon == Tamagotchi.get_pokemon!(pokemon.id)
    end

    test "delete_pokemon/1 deletes the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{}} = Tamagotchi.delete_pokemon(pokemon)
      assert_raise Ecto.NoResultsError, fn -> Tamagotchi.get_pokemon!(pokemon.id) end
    end

    test "change_pokemon/1 returns a pokemon changeset" do
      pokemon = pokemon_fixture()
      assert %Ecto.Changeset{} = Tamagotchi.change_pokemon(pokemon)
    end
  end
end
