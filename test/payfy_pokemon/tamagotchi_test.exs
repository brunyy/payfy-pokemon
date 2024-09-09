defmodule PayfyPokemon.TamagotchiTest do
  use PayfyPokemon.DataCase

  alias PayfyPokemon.Tamagotchi

  describe "pokemons" do
    alias PayfyPokemon.Tamagotchi.Pokemon

    import PayfyPokemon.TamagotchiFixtures

    @invalid_attrs %{name: nil, pokeapi_id: nil, user_id: nil}

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Enum.member?(Tamagotchi.list_pokemons(), pokemon)
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      actual_pokemon = Tamagotchi.get_pokemon!(pokemon.id)
      assert pokemon.id == actual_pokemon.id
      assert pokemon.name == actual_pokemon.name
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      valid_attrs = %{name: "some name", pokeapi_id: 1, user_id: 1}
      assert {:ok, %Pokemon{} = pokemon} = Tamagotchi.create_pokemon(valid_attrs)
      assert pokemon.name == "some name"
      assert pokemon.pokeapi_id == 1
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tamagotchi.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Pokemon{} = pokemon} = Tamagotchi.update_pokemon(pokemon, update_attrs)
      assert pokemon.name == "some updated name"
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
