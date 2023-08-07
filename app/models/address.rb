class Address < ApplicationRecord
  belongs_to :order
  belongs_to :shipping_prefecture

end