defmodule Recipes.Repo.Migrations.CreateRecipes do
  use Ecto.Migration
  
  def change do
    create table(:recipes) do
      add :chef_id, :string, null: true
      add :chef, :string, null: true
      add :food_type, :string, null: true
      add :name, :string, null: false
      add :directions, :map, null: false
      add :ingredients, :map, null: false
      add :meal, :string, null: true
      add :picture, :string, null: true
      add :geography, :string, null: true
      add :recipe_url, :string, null: false
      add :description, :text, null: true
    end
  end
end