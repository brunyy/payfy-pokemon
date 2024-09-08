defmodule PayfyPokemon.Repo.Migrations.AddSpeciesColumn do
  use Ecto.Migration

  def change do
    alter table(:pokemons) do
      add :species, :string
    end
  end
end
