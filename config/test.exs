import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :payfy_pokemon, PayfyPokemon.Repo,
  username: "bruna",
  password: "",
  hostname: "bruna.database.windows.net",
  port: 1433,
  database: "pokemon",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  ssl: true,
  ssl_opts: [verify: :verify_none]

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :payfy_pokemon, PayfyPokemonWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "fjl481mAJ8WbawT7bzUSpLze8JgPc3nIeBpx3DjLRzP3H86T4xw63+hiTDrvFX/W",
  server: false

# In test we don't send emails
config :payfy_pokemon, PayfyPokemon.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
