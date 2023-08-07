class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :item_id
  validates :user_id
end