require 'rails_helper'

describe Recipe do
  describe "validations" do

    it "requires a name" do
      recipe = Recipe.new(name: "")
      recipe.valid?
      expect(recipe.errors).to have_key(:name)
    end
    it "requires a description" do
      recipe = Recipe.new(description: "")
      recipe.valid?
      expect(recipe.errors).to have_key(:description)
    end
    it "does not require amount of calories" do
      recipe = Recipe.new(calories: nil)
      recipe.valid?
      expect(recipe.errors).not_to have_key(:calories)
    end
  end

  describe "#calorie_bomb?" do
    it "is true if the calories are more than 800" do
      recipe = Recipe.new(calories: 801)
      expect(recipe.calorie_bomb?).to eq(true)
    end
  end
end
