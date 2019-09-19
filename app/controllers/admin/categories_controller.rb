class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["username"], password: ENV["password"]

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: "Product created!"
    else
      render :new
    end
  end
end
