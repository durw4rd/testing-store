require 'rails_helper'

describe "navigating recipes" do
  it "allows navigating from the detail page to the listing page" do
    recipe = Recipe.create(
                      name: "Spanish Omelet",
                      description: "Delicious"
                      )

    visit recipe_url(recipe)
    click_link "Back"

    expect(current_path).to eq(recipes_path)
  end
  it "allows navigating from the index page to the new listing page" do
    recipe = Recipe.create(
                      name: "Spanish Omelet",
                      description: "Delicious"
                    )

    visit recipes_url([recipe])
    click_link "New Recipe"

    expect(current_path).to eq(new_recipe_path)
  end

end
