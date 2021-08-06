defmodule RecipeGeneratorWeb.PageController do
  use RecipeGeneratorWeb, :controller
  
  # def index(conn, _params) do
  # {:ok, recipes} = RecipeGenerator.get_recipes()

  # render(
  # conn, 
  # "index.html", 
  # props: Poison.encode!(%{"recipes" => recipes}),
  # propsTwo: %{"recipes" => recipes}
  # )
  # end
  # end

  # def index(conn, _params) do
  #   #{:ok, recipes} = RecipeGenerator.get_recipes()
  #   {:ok, recipes} = RecipeGenerator.recipe_scraper("jamie", "gordon", "allrecipes")

  #   render(
  #     conn,
  #     "index.html",
  #     props: Poison.encode!(%{"recipes" => recipes}),
  #     propsTwo: %{"recipes" => recipes}
  #   )
  # end

  def index(conn, _params) do
    #{:ok, recipes} = RecipeGenerator.get_recipes()
    recipes = Recipes.Repo.all(Recipes.Recipe)
    
    render(
      conn,
      "index.html",
      props: Poison.encode!(%{recipes: recipes})
    )
  end
end
