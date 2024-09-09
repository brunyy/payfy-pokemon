defmodule PayfyPokemon.Repo.Migrations.ChangePokeapiIdToInteger do
  use Ecto.Migration

  def change do
    alter table(:pokemons) do
      remove :pokeapi_id
    end
    alter table (:pokemons) do
      add :pokeapi_id, :integer
    end
  end
end
