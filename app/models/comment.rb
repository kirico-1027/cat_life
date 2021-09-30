class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true
  
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :user
  
  def checklike?(current_user)
    comment.likes.include?(current_user)
  end
end
