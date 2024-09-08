defmodule PayfyPokemon.Tamagotchi.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemons" do
    field :name, :string
    field :status, :string
    field :hunger, :integer
    field :pokeapi_id, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name, :hunger, :status, :pokeapi_id])
    |> validate_required([:name, :hunger, :status, :pokeapi_id])
  end
end
