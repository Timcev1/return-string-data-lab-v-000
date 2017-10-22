class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
    render plain: Product.find(params[:id]).inventory != 0 && !Product.find(params[:id]).inventory.nil? ? "true" : "false"
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
		redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
