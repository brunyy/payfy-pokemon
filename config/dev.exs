import Config
config :payfy_pokemon, PayfyPokemon.Repo,
  username: "bruna",
  password: "",
  hostname: "bruna.database.windows.net",
  port: 1433,
  database: "pokemon",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  ssl: true,
  ssl_opts: [verify: :verify_none]

config :payfy_pokemon, PayfyPokemonWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "lEmYldGMGflw7Bx/EDMKORlU1XzptsMDzKlQC5xwkuNB3LzmXPxeJ0LEvRc2guD0",
  watchers: []

config :payfy_pokemon, dev_routes: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :swoosh, :api_client, false
