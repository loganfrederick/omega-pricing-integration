class SaveProducts
  attr_accessor :products

  def initialize(products)
    @products = products
  end

  def save
    products.each do |product_hash| 
      product = Product.find_by(external_product_id: product_hash[:id])
      process_product(product, product_hash)
    end
  end

  def process_product(product, product_hash)
    if new_continued_product?(product, product_hash)
      create_product(product_hash)
    elsif matching_product_with_new_price?(product, product_hash) 
      update_product(product, product_hash)
    elsif matching_product_id_but_different_name?(product, product_hash)
      Rails.logger.debug("Mismatch on product #{product_hash[:name]} with External ID: #{product.external_product_id}")
    else
      Rails.logger.debug("*****NO PRODUCT TO CREATE OR UPDATE*****")
    end
  end

  def matching_product_with_new_price?(product, product_hash)
    return false if product.blank?
    (product.external_product_id == product_hash[:id]) && (product.product_name == product_hash[:name]) && (product.price != product_hash[:price])
  end

  def matching_product_id_but_different_name?(product, product_hash)
    return false if product.blank?
    (product.external_product_id == product_hash[:id]) && (product.product_name != product_hash[:name])
  end

  def new_continued_product?(product, product_hash)
    product.blank? && !product_hash[:discontinued]
  end

  def create_product(product_hash)
    new_product_hash = {
      external_product_id: product_hash[:id],
      price: product_hash[:price],
      product_name: product_hash[:name]
    }

    Rails.logger.info("Making new product with name #{product_hash[:name]} and external ID: #{product_hash[:external_product_id]}")
    Product.create(new_product_hash)
  end

  def update_product(product, product_hash)
    # TODO: Calculate percentage change and update field
    PastPriceRecord.create({
        product_id: product.product_id,
        price: product.price
      })

    product.update(price: product_hash[:price])
  end
end
