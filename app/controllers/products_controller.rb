class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @rating = Rating.new

    @current_user = User.find(session[:user_id]) if session[:user_id]

    @product = Product.find params[:id]
    @ratings = @product.ratings
    sum = 0
    if @ratings.count > 0
       @ratings.each do |rating|
        sum += rating.rating
    end
    @avgRating = sum / @ratings.count
    end
  end
end
