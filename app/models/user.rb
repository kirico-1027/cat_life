class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorite(comment)
    favorites.find_or_create_by(comment_id: comment.id)
  end
  
  def unfavorite(comment)
    favorite = favorites.find_by(comment_id: comment.id)
    favorite.destroy if favorite
  end
end
