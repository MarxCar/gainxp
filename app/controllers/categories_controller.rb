class CategoriesController < ApplicationController
    def new
       if require_login
          @category = Category.new 
       end
    end
    def create
        category = Category.new(category_params)
        if category.save
            flash.now[:success] = "You have created the #{category.title} category!"
            redirect_to root_path
        else
           flash[:danger] = "Title must be present"
           render 'new'
        end
    end
    def show
        @category = Category.find_by(id: params[:id])
        @listings = @category.listings
    end
    
    private
    def category_params
        params.require(:category).permit(:title)
    end
    

end
