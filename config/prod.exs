import Config

config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: PayfyPokemon.Finch

config :swoosh, local: false

config :logger, level: :info

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
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "vXCQFsuodAO4Nn7AZsled8L62xowsBdPlSSd\cd8vrKEdwR+v+zOQGdD8No5GhbS",
  watchers: [],
  server: true
