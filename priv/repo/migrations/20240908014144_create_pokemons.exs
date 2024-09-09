defmodule PayfyPokemon.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :name, :string
      add :hunger, :integer
      add :status, :string
      add :pokeapi_id, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:pokemons, [:user_id])
  end
end
