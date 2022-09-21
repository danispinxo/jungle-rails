class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => ENV["ADMIN_USER_NAME"], :password => ENV["ADMIN_PASSWORD"] 

  def index
    @categories = Category.order(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
