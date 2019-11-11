class RecipesController < ApplicationController
    def index 
        # @recipes = Recipe.where("user_id": params[:user_id]).all
        if params[:filter]
            @recipes = Recipe.by_date.by_category(params[:filter])
        else
            @recipes = Recipe.all
        end
    
    end 

    def show
        @recipe = Recipe.find(params[:id])
    end 

    def new
        @user = User.find(current_user.id)
        @recipe = @user.recipes.build
        @category = params[:category_id]
        @recipe.category_id = @category
    end

    def create
         if current_user.id == recipe_params[:user_id].to_i
            @recipe = Recipe.new(recipe_params)
            if @recipe.save
                redirect_to @recipe
            else
                render :new
            end
         end
    end 
    
    private

    def recipe_params
            params.require(:recipe).permit(:name, :user_id, :category_id)
    end 

end


   