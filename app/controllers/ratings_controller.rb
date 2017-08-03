class RatingsController < ApplicationController
  before_filter :current_user
  def create
    rating = Rating.new(product_id: params[:product_id], rating: params[:rating][:rating], description: params[:rating][:description], user_id: current_user.id)
    if rating.save
      puts "saved!"
      redirect_to :back
    else
      puts "not saved..", rating.inspect
      redirect_to :back
    end
  end

  def ratings_params
    params.require(:ratings).permit(:rating, :description)
  end

  def destroy
    rating = Rating.find params[:id]
    if rating.destroy
      puts " rating destroyed"
      redirect_to :back
    end
  end

end
