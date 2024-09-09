defmodule PayfyPokemon.Repo.Migrations.ChangeFaintedToBool do
  use Ecto.Migration

  def change do
    alter table(:pokemons) do
      add :fainted, :boolean, default: false
    end
    alter table (:pokemons) do
      remove :status
    end
  end
end
