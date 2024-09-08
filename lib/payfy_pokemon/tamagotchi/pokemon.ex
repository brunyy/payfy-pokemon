defmodule PayfyPokemon.Tamagotchi.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemons" do
    field :name, :string
    field :species, :string
    field :fainted, :boolean, default: false
    field :hunger, :integer, default: 0
    field :pokeapi_id, :integer
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name, :species, :fainted, :hunger, :pokeapi_id, :user_id])
    |> validate_required([:name, :pokeapi_id, :user_id])
    |> validate_number(:hunger, greater_than_or_equal_to: 0)
  end
end
