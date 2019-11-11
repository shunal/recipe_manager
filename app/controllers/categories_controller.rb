class CategoriesController < ApplicationController
    
    def index
        @categories = Category.all
    end 
    
    def show 
        @category = Category.find_by(id: params[:id])
    end 

    def new 
        @category = Category.new
    end 

    def create 
        @category = Category.find_or_create_by(name: params[:category][:name].titleize)
        if @category.save
            redirect_to new_category_recipe_path(@category)
        else
            
            render :new
        end 
    end 

    def update
        @category = Category.find_or_create_by(category_params)
        if @category.save
            redirect_to new_category_recipe_path(@category)
        else
            
            render :new
        end 
    end 

    private 

    def category_params
        params.require(:category).permit(:name)
    end 
end
