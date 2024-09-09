defmodule PayfyPokemon.Repo.Migrations.AddMissingPokeapiId do
  use Ecto.Migration

  def change do
    alter table (:pokemons) do
      add :pokeapi_id, :integer
    end
  end
end
