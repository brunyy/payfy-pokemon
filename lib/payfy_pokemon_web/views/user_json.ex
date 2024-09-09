defmodule PayfyPokemonWeb.UserJSON do
  alias PayfyPokemon.Accounts.User
  alias PayfyPokemonWeb.PokemonJSON

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      team: render_team(user.pokemons)
    }
  end

  defp render_team(pokemons) do
    for(pokemon <- pokemons, do: PokemonJSON.show(%{pokemon: pokemon}))
  end
end
