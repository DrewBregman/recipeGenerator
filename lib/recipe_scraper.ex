defmodule Mix.Tasks.RecipeScraper do
    @moduledoc false

    use Mix.Task
    alias Recipes.Recipe
    alias Recipes.Repo

    @scraper_config %{
      "gordon" => %{
        "domain" => "https://www.gordonramsay.com",
        "picture_domain" => "https://www.gordonramsay.com",
        "dom_selectors" => %{
          "recipe_page_link" => ".recipe .summary a.button",
          "recipe_name" => ".hero-title-recipe h2",
          "recipe_ingredients" => "ul.recipe-division li",
          "recipe_directions" => "ol.recipe-division li",
          "recipe_description" => "",
          "recipe_picture" => ".imagebg img",
          "additional_attribute" => "",
        },
        "target_pages" => [
          %{
            "recipe_extension" => "/gr/recipes/category/chicken",
            "meal" => nil,
            "food_type" => "chicken",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/gr/recipes/category/beef",
            "meal" => nil,
            "food_type" => "beef",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/gr/recipes/category/vegetarian",
            "meal" => nil,
            "food_type" => "vegetarian",
            "geography" => nil,
         },
         %{
          "recipe_extension" => "/gr/recipes/category/fit-food",
          "meal" => nil,
          "food_type" => "healthy",
          "geography" => nil,
         }
        ]      
      },
      "jamie" => %{
        "domain" => "https://www.jamieoliver.com",
        "picture_domain" => "",
        "dom_selectors" => %{
          "recipe_page_link" => ".recipe-block a",
          "recipe_name" => ".single-recipe-details-mobile-top h3",
          "recipe_ingredients" => "ul.ingred-list li",
          "recipe_directions" => "ol.recipeSteps li",
          "recipe_description" => ".recipe-intro",
          "recipe_picture" => ".hero-wrapper img",
          "additional_attribute" => "",

        },
        "target_pages" => [
          %{
            "recipe_extension" => "/recipes/vegetables-recipes/",
            "meal" => nil,
            "food_type" => "vegetarian",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/eggs-recipes/",
            "meal" => nil,
            "food_type" => "eggs",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/chicken-recipes/" ,
            "meal" => nil,
            "food_type" => "chicken",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/fish-recipes/",
            "meal" => nil,
            "food_type" => "fish",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/lamb-recipes/",
            "meal" => nil,
            "food_type" => "lamb",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/beef-recipes/",
            "meal" => nil,
            "food_type" => "beef",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/pork-recipes/",
            "meal" => nil,
            "food_type" => "pork",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/rice-recipes/",
            "meal" => nil,
            "food_type" => "rice",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/turkey-recipes/",
            "meal" => nil,
            "food_type" => "turkey",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/seafood-recipes/",
            "meal" => nil,
            "food_type" => "seafood",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/steak-recipes/",
            "meal" => nil,
            "food_type" => "steak",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/mains/",
            "meal" => "main",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/snacks/",
            "meal" => "snacks",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/meals-for-one/",
            "meal" => "meal for one",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/cheap-cheerful/",
            "meal" => "cheap",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/breakfast/",
            "meal" => "breakfast",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/one-pan-recipes/",
            "meal" => "one pan",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/drinks/",
            "meal" => "drinks",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/sauces/",
            "meal" => "sauce",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/aperitifs/",
            "meal" => "aperitif",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/course/cocktails/",
            "meal" => "cocktail",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "/recipes/category/world/french/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "french",
          },
          %{
            "recipe_extension" => "/recipes/category/world/mexican/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "mexican",
          },
          %{
            "recipe_extension" => "/recipes/category/world/italian/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "italian",
          },
          %{
            "recipe_extension" => "/recipes/category/world/indian/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "indian",
          },
          %{
            "recipe_extension" => "/recipes/category/world/asian/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "asian",
          },
          %{
            "recipe_extension" => "/recipes/category/world/greek/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "greek",
          },
          %{
            "recipe_extension" => "/recipes/category/world/moroccan/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "moroccan",
          },
          %{
            "recipe_extension" => "/recipes/category/world/chinese/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "chinese",
          }
        ]
      },
      "allrecipes" => %{
        "domain" => "",
        "picture_domain" => nil,
        "dom_selectors" => %{
          "recipe_page_link" =>  "a.card__titleLink",
          "recipe_name" =>".headline-wrapper h1",
          "recipe_ingredients" => "ul.ingredients-section li",
          "recipe_directions" => "ul.instructions-section",
          "recipe_description" => ".recipe-summary p",
          "recipe_chef" => ".author-name",
          "recipe_picture" => ".image-container div",
          "additional_attribute" => "data-",
        },
        "target_pages" => [
          %{
            "recipe_extension" => "https://www.allrecipes.com/recipes/201/meat-and-poultry/chicken/",
            "meal" => nil,
            "food_type" => "chicken",
            "geography" => nil,
          },
          %{
            "recipe_extension" => "https://www.allrecipes.com/recipes/17561/lunch/",
            "meal" => "lunch",
            "food_type" => nil,
            "geography" => nil,
          },
          %{
            "recipe_extension" => "https://www.allrecipes.com/recipes/78/breakfast-and-brunch/",
            "meal" => "breakfast",
            "food_type" => nil,
            "geography" => nil,
          },
          # %{ #There is an issue when including this URL in the recipe_scraper, because one of the recipe links contains a video instead of a picture
          #   "recipe_extension" => "https://www.allrecipes.com/recipes/17562/dinner/",
          #   "meal" => "dinner",
          #   "food_type" => "",
          #   "geography" => "",
          # },
          %{
            "recipe_extension" => "https://www.allrecipes.com/recipes/86/world-cuisine/",
            "meal" => nil,
            "food_type" => nil,
            "geography" => "international",
          },
          %{
            "recipe_extension" =>"https://www.allrecipes.com/recipes/93/seafood/",
            "meal" => nil,
            "food_type" => "seafood",
            "geography" => nil,
          }
        ]
      }
    }

    @valid_domain_slugs Map.keys(@scraper_config)

    # mix recipe_scraper gordon
    # mix recipe_scraper jamie
    def run([domain_slug | _rest] = _args) when domain_slug in @valid_domain_slugs do
      Application.ensure_all_started(:recipeGenerator)

      @scraper_config[domain_slug]["target_pages"]
      |> Enum.map(fn page_config ->
        %{page_config | "recipe_extension" => @scraper_config[domain_slug]["domain"] <> page_config["recipe_extension"]}
      end)
      |> Enum.map(&scrape_recipe_links(&1, domain_slug))
      |> Enum.map(fn urls_meal -> 
        Enum.map(urls_meal.recipe_links, fn recipe_link ->  %Recipe{
          recipe_url: recipe_link,
          meal: urls_meal.meal,
          food_type: urls_meal.food_type,
          geography: urls_meal.geography
        } end)
      end)
      |> List.flatten()
      |> Enum.map(&scrape_recipe(&1, domain_slug))
      |> Enum.map(&Repo.insert!(&1))
    end

    defp scrape_recipe_links(%{"recipe_extension" => url}, domain_slug) do 
      Mix.shell().info("Scraping recipe links from #{url}")

      %{body: body} = HTTPoison.get!(url)

      recipe_links =
        body
        |> Floki.parse_document!()
        |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_page_link"])
        |> Floki.attribute("href")
        |> Enum.map(fn maybe_relative_url ->
          @scraper_config[domain_slug]["domain"] <> maybe_relative_url
        end)

      Mix.shell().info("Found #{length(recipe_links)} recipe links")

      meal = get_meal(url, domain_slug)
      food_type = get_food_type(url, domain_slug)
      geography = get_geography(url, domain_slug)

      %{recipe_links: recipe_links, meal: meal, food_type: food_type, geography: geography}

    end

    defp scrape_recipe(%Recipe{recipe_url: url} = recipe, domain_slug) do
      Mix.shell().info("Scraping recipe from #{url}")
      %{body: body} = HTTPoison.get!(url, [timeout: :infinity, recv_timeout: :infinity])
      #IO.inspect(url, domain_slug, label: "url & domain slug")
      %Recipe{
        recipe |
        name: get_recipe_name(body, domain_slug),
        directions: get_recipe_directions(body, domain_slug),
        ingredients: get_recipe_ingredients(body, domain_slug),
        chef: get_recipe_chef(body, domain_slug),
        picture: get_recipe_picture(body, domain_slug),
        description: get_recipe_description(body, domain_slug),
        #recipe_url: url,
        #meal: get_meal(url, domain_slug)
        #meal: @scraper_config[domain_slug]["target_pages"]["meal"]
        #food_type: get_food_type(domain_slug),
        #geography: get_geography(domain_slug)
      }
    end


    defp get_recipe_name(html, domain_slug) do
      html
      |> Floki.parse_document!()
      |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_name"])
      |> Floki.text()
    end

    defp get_recipe_ingredients(html, domain_slug) do
      html
      |> Floki.parse_document!()
      |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_ingredients"])
      |> Floki.text(sep: "+")
      |> String.split("+")
    end

    defp get_recipe_description(html, domain_slug) do
      case domain_slug do
        "gordon" -> "A Gordon Ramsay Recipe"
        "jamie" -> 
          html
          |> Floki.parse_document!()
          |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_description"])
          |> Floki.text()
        "allrecipes" ->
          html
          |> Floki.parse_document!()
          |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_description"])
          |> Floki.text()
      end 
    end

    defp get_recipe_chef(html, domain_slug) do
          

      case domain_slug do
        "gordon" -> "Gordon Ramsay"
        "jamie" -> "Jamie Oliver"
        "allrecipes" -> (html
        |> Floki.parse_document!()
        |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_chef"])
        |> Floki.text())  <> "from www.allrecipes.com"
          
      end
    end

    defp get_recipe_directions(html, domain_slug) do
      html
      |> Floki.parse_document!()
      |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_directions"])
      |> Floki.text(sep: "=>")
      |> String.split("=>")
    end

    defp get_recipe_picture(html, domain_slug) do
      recipe_picture_url = 
        html
        |> Floki.parse_document!()
        |> Floki.find(@scraper_config[domain_slug]["dom_selectors"]["recipe_picture"])
        |> Floki.attribute(@scraper_config[domain_slug]["dom_selectors"]["additional_attribute"]<>"src")
        |> List.first()

      case domain_slug do 
      "gordon" -> @scraper_config[domain_slug]["picture_domain"] <> recipe_picture_url
      "jamie" -> recipe_picture_url
      "allrecipes" -> recipe_picture_url
      end
        
    end
    
    defp get_meal(url, domain_slug) do
      IO.inspect(url, label: "URL")
      meal = 
        @scraper_config[domain_slug]["target_pages"]
        |> Enum.find(fn page_config -> String.contains?(url, page_config["recipe_extension"]) end)
        |> Map.get("meal")
        IO.inspect(meal, label: "meal")
    end

      
    defp get_food_type(url, domain_slug) do
      food_type = 
        @scraper_config[domain_slug]["target_pages"]
        |> Enum.find(fn page_config -> String.contains?(url, page_config["recipe_extension"]) end)
        |> Map.get("food_type")
      
        IO.inspect(food_type, label: "food_type")
    end

      
    defp get_geography(url, domain_slug) do
      geography = 
        @scraper_config[domain_slug]["target_pages"]
        |> Enum.find(fn page_config -> String.contains?(url, page_config["recipe_extension"]) end)
        |> Map.get("geography")

      IO.inspect(geography, label: "geography")
    end

  end
  

