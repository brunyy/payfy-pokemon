defmodule PayfyPokemonWeb.Router do
  use PayfyPokemonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PayfyPokemonWeb do
    pipe_through :api
    get "/users/:id", UserController, :show
    post "/users", UserController, :create
    put "/users/:id", UserController, :update
    delete "/users/:id", UserController, :delete
    post "/pokemons", PokemonController, :create
    delete "/pokemons/:id", PokemonController, :delete
    put "/pokemons/:id", PokemonController, :update
    get "/pokemons", PokemonController, :index
    get "/pokemons/:id", PokemonController, :show
    post "/pokemons/:id/feed", PokemonController, :feed
    post "/pokemons/:id/revive", PokemonController, :revive
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:payfy_pokemon, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: PayfyPokemonWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
