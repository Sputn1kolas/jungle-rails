class RatingsController < ApplicationController
  before_filter :current_user
  def create
    puts params.inspect
    rating = Rating.new(product_id: params[:product_id], rating: params[:rating][:rating], description: params[:rating][:description], user_id: current_user.id)
    if rating.save
      puts "saved!"
      redirect_to '/'
    else
      puts "not saved..", rating.inspect
      redirect_to '/'
    end
  end

  def ratings_params
    params.require(:ratings).permit(:rating, :description)
  end

end
