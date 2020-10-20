class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :asc).limit 6
    @products_with_discount = Product.order(:price).limit 1
  end

  def create
    values = params.require(:product).permit(:name, :description, :price, :amount)
    product = Product.new values
    if product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    id = params[:id]
    Product.destroy id
    redirect_to root_path
  end

  def search
    @name = params[:name]
    @products = Product.where 'name like ?', "%#{@name}%"
  end
end
