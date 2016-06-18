class CategoriesController < ApplicationController
    def new
       if require_login
          @category = Category.new 
       end
    end
    def create
        category = Category.new(category_params)
        if category.save
            flash[:success] = "You have created the #{category.title} category!"
            redirect_to new_listing_path
        else
           flash.now[:danger] = "Title must be present"
           render 'new'
        end
    end
    def show
        @category = Category.find_by(id: params[:id])
        @listings = listing_category(@category.listings)
        @categories = Category.all.order(:title)
    end
    
    private
    def category_params
        params.require(:category).permit(:title)
    end
    

end
