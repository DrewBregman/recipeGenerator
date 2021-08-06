# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :recipeGenerator, Recipes.Repo,
  database: "recipeGenerator_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :recipeGenerator, ecto_repos: [Recipes.Repo]

config :recipeGenerator, Recipes.Repo,
  database: "recipeGenerator_repo",
  username: "postgres",
  password: "pass",
  hostname: "localhost"

# Configures the endpoint
config :recipeGenerator, RecipeGeneratorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+GORZTvHULNk/ihKSMkE3IeuknU/AB3mm+OjKHdd/O6xE2G9vEiYZ+GaOhWFCrC2",
  render_errors: [view: RecipeGeneratorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RecipeGenerator.PubSub,
  live_view: [signing_salt: "irMjFBGi"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
