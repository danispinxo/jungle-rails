class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with :name => ENV["ADMIN_USER_NAME"], :password => ENV["ADMIN_PASSWORD"] 
  
  def show
    @name = ENV["ADMIN_USER_NAME"]
    @categories = Category.all
    @total_products = Product.count
    @total_inventory = Product.sum(:quantity)
  end
end
