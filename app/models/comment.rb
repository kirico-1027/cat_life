class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true
end
