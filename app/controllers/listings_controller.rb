class ListingsController < ApplicationController
    before_action :require_login, :except => [:index, :show]
    
    def index
       @listings = listing_category(Listing)
       @categories = Category.all.order(:title)
    end
    def new
        
        @listing = Listing.new
        
    end
    
    def create
        @listing = Listing.new(listing_params)
        if @listing.save
            flash[:success] = "Created Listing"
            redirect_to new_listing_path
        else
            
            render 'new' 
        end
    end
    def destroy
        Listing.find(params[:id]).destroy  
        redirect_to root_path
    end
    def edit
       @listing = Listing.find(params[:id]) 
    end
    
    def update
        @listing = Listing.find(params[:id])
        
        if @listing.update_attributes(listing_params)
            flash[:success] = "You have edited the job posting, \"#{@listing.title}\""
            redirect_to root_path
        else
            render 'new' 
        end
    end
    
    
    private
    def listing_params
        params.require(:listing).permit(:title, :link,:description, :deadline, :salary, :wage,:organization,:city_id,:category_ids => [])
    end
end
