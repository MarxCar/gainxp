class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  helper_method :order_type, :current_city
  def require_login
    unless logged_in?
      flash[:danger] = "You need to be logged in to do that!"
      redirect_to login_path
    else
      return true
    end
    
  end
  
  def order_type
    if params[:order_type].nil?
      return 'Posted Date'
    else
      return params[:order_type]
    end
  end
  
  def order_type_db

    return 'created_at DESC' if order_type == 'Posted Date'
    return order_type.downcase 
  end
  def current_city
    return params[:city] || 1
  end
  def city_listings type
    if params[:city].nil? or params[:city].empty?
      return type.all
    end
    type.where("city_id = ?", params[:city])
  end

  def listing_category type
    city_listings(type).search(params[:search]).order(order_type_db).paginate(:per_page => 8, :page => params[:page])
  end

end
