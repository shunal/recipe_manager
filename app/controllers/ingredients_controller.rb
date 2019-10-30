class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.where("recipe_id": params[:recipe_id]).all
    end 

    def show
        @ingredient = Ingredient.find(params[:id])
    end 

    def new
        recipe = Recipe.find(params[:recipe_id])
        @ingredient = recipe.ingredients.build
    end 

    def create
        
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
         redirect_to recipe_path(@ingredient.recipe_id)
        else
            render :new
        end
    end 
    
    private

    def ingredient_params
            params.require(:ingredient).permit(:name, :recipe_id)
    end 

    
end
