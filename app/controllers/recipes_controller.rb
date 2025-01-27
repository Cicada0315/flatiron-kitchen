class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    def new
        @recipe=Recipe.new
        @recipe.ingredients.build
        @recipe.ingredients.build
    end

    def create
        @recipe=Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def show
    end

    def edit
        @ingredient=Ingredient.new
    end

    def update
       if @recipe.update(recipe_params)
           redirect_to recipe_path(@recipe)
       else
        render :edit
       end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end
    

    private
    def set_recipe
        @recipe=Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :ingredient_ids => [], ingredients_attributes: [:name])
    end
end
