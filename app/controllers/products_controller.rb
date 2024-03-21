class ProductsController < ApplicationController
  def create
    product = Product.new(product_params)
    if product.save
      render json: product
    else
      render json: "something went wrong!"
    end
  end

  def get_product_by_category
    category = Category.find_by(id: params[:id])
    render json: category.products
  end

  private
  def product_params
    params.require(:product).permit(:title,:price,:category_id,:user_id,:amount)
  end
end