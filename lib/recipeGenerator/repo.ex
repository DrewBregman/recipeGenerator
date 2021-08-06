defmodule Recipes.Repo do
  use Ecto.Repo,
    otp_app: :recipeGenerator,
    adapter: Ecto.Adapters.Postgres
end
