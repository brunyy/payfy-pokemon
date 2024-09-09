defmodule PayfyPokemon.PokeAPI do
  def get_pokemon(id) do
    HTTPoison.get!("https://pokeapi.co/api/v2/pokemon/#{id}")
    |> handle_response()
  end

  defp handle_response(%HTTPoison.Response{status_code: 200, body: body}) do
    {:ok, Jason.decode!(body)}
  end
end
