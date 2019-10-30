class RecipesController < ApplicationController
    def index 
        @recipes = Recipe.where("user_id": params[:user_id]).all
    end 

    def show
        @recipe = Recipe.find(params[:id])
    end 

    def new
        @user = User.find(params[:user_id])
        @recipe = @user.recipes.build
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end 
    
    private

    def recipe_params
            params.require(:recipe).permit(:name, :user_id)
    end 

end


   