defmodule PayfyPokemon.Accounts.User do
  alias PayfyPokemon.Tamagotchi
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    has_many :pokemons, Tamagotchi.Pokemon
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
