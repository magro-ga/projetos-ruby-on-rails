class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.order(name: :asc).limit 6
    @products_with_discount = Product.order(:price).limit 1
  end

  def new
    @product = Product.new
    @departments = Department.all
  end

  def edit
    renders :edit
  end

  def update
    if @product.update product_params
      flash[:notice] = 'Produto atualizado com sucesso!'
      redirect_to root_url
    else
      renders :edit
    end
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = 'Produto salvo com sucesso!'
      redirect_to root_url
    else
      renders :new
    end
  end

  def destroy
    @product.destroy
    redirect_to root_url
  end

  def search
    @name = params[:name]
    @products = Product.where 'name like ?', "%#{@name}%"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :amount, :department_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def renders(view)
    @departments = Department.all
    render view
  end
end