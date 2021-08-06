import React from 'react';
import MenuCard from './MenuCard.js';

export default function RandomRecipe({recipes}) {

  const random_recipe = recipes[Math.floor(Math.random()*recipes.length)]
  const ingredientList = (random_recipe.ingredients).map((ingredient) =>
    <li key={ingredient.id}>
      {ingredient}
    </li>
  );
  return (
    <div>
      <MenuCard random_recipe={random_recipe} ingredientList={ingredientList} />
    </div>
  )
}
