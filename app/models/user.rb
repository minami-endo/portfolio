class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :likes, dependent: :destroy
  has_many :like_stories, through: :likes, source: :story
  attachment :image

  enum is_deleted: { available: false, withdrawal: true }
  def active_for_authentication?
    super && (self.is_deleted == "available")
  end


end
