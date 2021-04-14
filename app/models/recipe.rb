class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    #accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }
    def ingredient_attributes=(attributes)
        if !(attributes[:name].blank?)
            binding.pry
            self.ingredients = Ingredient.find_or_create_by(attributes)
        end
    end
end
