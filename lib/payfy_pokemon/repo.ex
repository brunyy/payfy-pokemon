defmodule PayfyPokemon.Repo do
  use Ecto.Repo,
    otp_app: :payfy_pokemon,
    adapter: Ecto.Adapters.Tds
end
