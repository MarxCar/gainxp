class ListingsController < ApplicationController
    
    def index
       @listings = Listing.search(params[:search])
       @categories = Category.all.order(:title)
    end
    def new
        if require_login
            @listing = Listing.new
        end
    end
    
    def create
        list = Listing.new(listing_params)
        if list.save
            flash.now[:success] = "Created Listing"
            redirect_to root_path
        else
            render 'new' 
        end
    end
    
    private
    def listing_params
        params.require(:listing).permit(:title, :link,:description, :deadline, :salary, :organization,:category_ids => [])
    end
end
