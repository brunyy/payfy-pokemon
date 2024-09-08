defmodule PayfyPokemon.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PayfyPokemonWeb.Telemetry,
      PayfyPokemon.Repo,
      PayfyPokemon.Scheduler,
      {DNSCluster, query: Application.get_env(:payfy_pokemon, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PayfyPokemon.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PayfyPokemon.Finch},
      # Start a worker by calling: PayfyPokemon.Worker.start_link(arg)
      # {PayfyPokemon.Worker, arg},
      # Start to serve requests, typically the last entry
      PayfyPokemonWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PayfyPokemon.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PayfyPokemonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
