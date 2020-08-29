class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :likes, dependent: :destroy
  has_many :like_recipes, through: :likes, source: :recipe
  attachment :image

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :email, presence: true, length: { minimum: 1, maximum: 40 }
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true, length: { maximum: 100 }

  enum is_deleted: { available: false, withdrawal: true }
  def active_for_authentication?
    super && (is_deleted == "available")
  end
end
