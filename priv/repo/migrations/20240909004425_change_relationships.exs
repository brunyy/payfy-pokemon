defmodule PayfyPokemon.Repo.Migrations.ChangeRelationships do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :name, :string
      add :email, :string, unique: true
      timestamps()
    end

    create table(:pokemons) do
      add :name, :string
      add :species, :string
      add :hunger, :integer
      add :fainted, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)
      timestamps()
    end

    create index(:pokemons, [:user_id])
  end
end
