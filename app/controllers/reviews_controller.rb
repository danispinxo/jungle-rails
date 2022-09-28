class ReviewsController < ApplicationController

  def create

    puts "Review params here: #{params["product_id"]}"

    @review = Review.new(review_params)
    @product = Product.find(params['product_id'])
    @review.product = @product
    @review.user = current_user
    @reviews = @product.reviews

    p @review

    if @review.save
      # @product = Product.find(@review.product_id)
      redirect_to "/products/#{@product.id}"
    else
      p @review.errors.full_messages
      redirect_to "/products/#{@product.id}"
    end

  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end
end
