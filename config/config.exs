# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_air,
  ecto_repos: [ExAir.Repo]

# Configures the endpoint
config :ex_air, ExAirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Nmj+667P/SPmqgmFDysPXUZhXI8qckI9svq9XwApLjXG4BxL06upY4q01g0poxiG",
  render_errors: [view: ExAirWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExAir.PubSub,
  live_view: [signing_salt: "ZX+zAiLZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_air, Friends.Repo,
  database: "ex_air",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
