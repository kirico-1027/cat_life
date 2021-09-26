class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
end
