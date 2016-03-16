class Product < ActiveRecord::Base
  has_many :past_price_records
end
