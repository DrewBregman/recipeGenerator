defmodule RecipeGenerator do
  @moduledoc """
  RecipeGenerator keeps the contexts that define your domain
  and business logic.
  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # this gets the chicken recipe urls from the Gordan Ramsay Website
  def get_recipes() do
    addresses = [
      # "https://www.gordonramsay.com/gr/recipes/category/chicken",
      # "https://www.gordonramsay.com/gr/recipes/category/beef",
      # "https://www.gordonramsay.com/gr/recipes/category/vegetarian",
      # "https://www.gordonramsay.com/gr/recipes/category/fit-food",
      # "https://www.allrecipes.com/recipes/201/meat-and-poultry/chicken/",
      # "https://www.allrecipes.com/recipes/17561/lunch/",
      # "https://www.allrecipes.com/recipes/78/breakfast-and-brunch/",
      # "https://www.allrecipes.com/recipes/17562/dinner/",
      # "https://www.allrecipes.com/recipes/86/world-cuisine/",
      # "https://www.allrecipes.com/recipes/93/seafood/",
      "https://www.jamieoliver.com/recipes/vegetables-recipes/",
      "https://www.jamieoliver.com/recipes/eggs-recipes/",
      "https://www.jamieoliver.com/recipes/chicken-recipes/",
      "https://www.jamieoliver.com/recipes/fish-recipes/",
      "https://www.jamieoliver.com/recipes/lamb-recipes/",
      "https://www.jamieoliver.com/recipes/beef-recipes/",
      "https://www.jamieoliver.com/recipes/pork-recipes/",
      "https://www.jamieoliver.com/recipes/rice-recipes/",
      "https://www.jamieoliver.com/recipes/turkey-recipes/",
      "https://www.jamieoliver.com/recipes/seafood-recipes/",
      "https://www.jamieoliver.com/recipes/steak-recipes/",
      "https://www.jamieoliver.com/recipes/category/course/mains/",
      "https://www.jamieoliver.com/recipes/category/course/snacks/",
      "https://www.jamieoliver.com/recipes/category/course/meals-for-one/",
      "https://www.jamieoliver.com/recipes/category/course/cheap-cheerful/",
      "https://www.jamieoliver.com/recipes/category/course/breakfast/",
      "https://www.jamieoliver.com/recipes/category/course/one-pan-recipes/",
      "https://www.jamieoliver.com/recipes/category/course/drinks/",
      "https://www.jamieoliver.com/recipes/category/course/sauces/",
      "https://www.jamieoliver.com/recipes/category/course/aperitifs/",
      "https://www.jamieoliver.com/recipes/category/course/cocktails/",
      "https://www.jamieoliver.com/recipes/category/world/french/",
      "https://www.jamieoliver.com/recipes/category/world/mexican/",
      "https://www.jamieoliver.com/recipes/category/world/italian/",
      "https://www.jamieoliver.com/recipes/category/world/indian/",
      "https://www.jamieoliver.com/recipes/category/world/asian/",
      "https://www.jamieoliver.com/recipes/category/world/greek/",
      "https://www.jamieoliver.com/recipes/category/world/moroccan/",
      "https://www.jamieoliver.com/recipes/category/world/chinese/"
    ]

    # RecipeGenerator.get_gordan_ramsay_recipes()
    recipe_links =
      addresses
      |> Enum.map(fn url ->
        dom_object =
          cond do
            String.contains?(url, "gordon") -> ".recipe .summary a.button"
            String.contains?(url, "jamie") -> ".recipe-block a"
            String.contains?(url, "allrecipes") -> ".card__detailsContainer-left a"
          end

        {url, dom_object}
      end)
      |> Enum.map(fn {url, dom_object} -> {url, HTTPoison.get(url), dom_object} end)
      |> Enum.map(fn {url, {:ok, result}, dom_object} ->
        {url, result.body, dom_object}
        # {url, {:error, reason}, _dom_object} -> raise "#{url} failed with #{reason}"
      end)
      |> Enum.map(fn
        {url, body, dom_object} ->
          urlz =
            body
            # |> IO.inspect(label: "body")
            |> Floki.find(dom_object)
            # |> IO.inspect(label: "floki find")
            |> Floki.attribute("href")

          # |> IO.inspect(label: "href")

          urls =
            cond do
              String.contains?(url, "gordon") -> join_gordon_url_string({urlz})
              String.contains?(url, "jamie") -> join_jamie_url_string({urlz})
              String.contains?(url, "allrecipes") -> {urlz}
            end

          {urls}

        {:ok, %HTTPoison.Response{status_code: 404}} ->
          IO.puts("Not Found :(")

        {:error, %HTTPoison.Error{reason: reason}} ->
          IO.inspect(reason)
      end)

    {:ok, recipe_links}
  end

  def join_gordon_url_string({urlz}) do
    urlz
    |> Enum.map(fn url -> url = "https://www.gordonramsay.com" <> "#{url}" end)
  end

  def join_jamie_url_string({urlz}) do
    urlz
    |> Enum.map(fn url -> url = "https://www.jamieoliver.com" <> "#{url}" end)
  end

  def get_recipe_html_body({_, recipe_links}) do
    recipe_links
    # |> IO.inspect(urls, label: "HERE IT IS")
    |> Enum.map(fn url -> {url, HTTPoison.get(url)} end)
    |> Enum.map(fn {url, {_, result}} -> {url, result.body} end)
  end

  def get_recipe_html_body(x) do
    # urls 
    # |> Enum.map(fn url -> {url, HTTPoison.get(url)} end)
    # |> Enum.map(fn {url, {_, result}} -> {url, result.body} end)
    IO.inspect(x, label: "THESE ARE URLS")
  end

  def get_recipe_ingredients({url, body}) do
    url
    |> Enum.map(fn url ->
      dom_object =
        cond do
          String.contains?(url, "gordon") -> "ul.recipe-division li"
          String.contains?(url, "jamie") -> "ul.ingred-list li"
          String.contains?(url, "allrecipes") -> "ul.ingredients-section li"
        end

      {url, dom_object}

      body
      |> Floki.find(dom_object)
      |> Floki.text(sep: "+")
      |> String.split("+")
    end)
  end

  def get_recipe_name({url, body}) do
    dom_object =
      cond do
        String.contains?(url, "gordon") -> ".hero-title-recipe h2"
        String.contains?(url, "jamie") -> ".single-recipe-details-mobile-top h3"
        String.contains?(url, "allrecipes") -> ".headline-wrapper h1"
      end

    {url, dom_object}
  end

  def get_recipe_chef({url, body}) do
    {url, body}
    |> Enum.map(fn {url, body} ->
      chef =
        cond do
          String.contains?(url, "gordon") ->
            {:ok, "Gordon Ramsay"}

          String.contains?(url, "jamie") ->
            {:ok, "Jamie Oliver"}

          String.contains?(url, "allrecipes") ->
            body
            |> Floki.find("author-name")
            |> Floki.text()
        end
    end)
  end

  def recipes() do
    recipes =
      get_recipes()
      |> get_recipe_html_body()
      |> Enum.flat_map(&get_recipe_html_body/1)
      |> Enum.map(fn {url, body} ->
        %{
          recipe_url: get_recipes()
          ## name: get_recipe_name({url, body}),
          ## ingredients: get_recipe_ingredients({url, body}),
          ## directions: get_recipe_directions({url, body}),
          # picture: List.first(get_recipe_picture({url, body})),
          ## chef_id: get_recipe_chef({url, body}),
          # food_type: get_recipe_food_type({url, body}),
          # meal: get_meal_type({url, body}),
        }
      end)

    {:ok, recipes}
  end

  def get_recipe_food_type(body) do
    body
    |> Floki.find(".hero-title-recipe h2")
    |> Floki.text()
  end

  def get_meal_type(body) do
    body
    |> Floki.find(".hero-title-recipe h2")
    |> Floki.text()
  end

  def get_recipe_directions(body) do
    body
    |> Floki.find("ol.recipe-division li")
    |> Floki.text(sep: "=>")
    |> String.split("=>")
  end

  def get_recipe_picture(body) do
    urls =
      body
      |> Floki.find(".imagebg img")
      |> Floki.attribute("src")

    picture = join_gordon_url_string({urls})
  end

  def get_recipes() do
    recipes =
      get_recipes()
      |> get_recipe_html_body()
      |> Enum.map(fn body ->
        %{
          recipe_url: get_recipes(),
          name: get_recipe_name(body),
          ingredients: get_recipe_ingredients(body),
          directions: get_recipe_directions(body),
          picture: List.first(get_recipe_picture(body)),
          chef_id: get_recipe_chef(body),
          food_type: get_recipe_food_type(body),
          meal: get_meal_type(body)
        }
      end)

    {:ok, recipes}
  end

  def random_recipe({_, recipes}) do
    random_recipe = Enum.random(recipes)

    {:ok, random_recipe}
  end

  def display_recipes({_, random_recipe}) do
    IO.puts(random_recipe.name)
    IO.puts(random_recipe.ingredients)
    IO.puts(random_recipe.directions)
    IO.puts(random_recipe.picture)
    IO.puts("++++++++++++++++++++++")
    {:ok, random_recipe}
  end
end

# RecipeGenerator.get_recipes() |> RecipeGenerator.random_recipe() |> RecipeGenerator.display_recipes()
