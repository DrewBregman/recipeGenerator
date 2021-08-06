defmodule Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

 schema "recipes" do
      field :chef_id, :string, null: true
      field :chef, :string, null: true
      field :food_type, :string, null: true
      field :name, :string, null: false
      field :directions, {:array, :string}, null: false
      field :ingredients, {:array, :string}, null: false
      field :meal, :string, null: true
      field :picture, :string, null: false
      field :recipe_url, :string, null: false
      field :geography, :string, null: true
      field :description, :string, null: true
  end
  
  def changeset(recipe, params \\ %{}) do
      recipe
      |> cast(params, [:chef_id, :food_type, :name, :directions, :ingredients, :meal, :picture,:recipe_url])
      |> unique_constraint(:recipe_url)
  end
end