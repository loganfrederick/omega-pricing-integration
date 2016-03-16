class ProductsController < ApplicationController
  layout 'application'

  # TODO: Better name for Omega API Integration action?
  def omega
    products = GetProducts.new.send_request
    SaveProducts.new(products[:productRecords]).save
  end

  def show
    @product = Product.find(params[:id]) if Product.count > 0
  end
end
