class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  validates :name, presence: true, length: { minimum: 2 , maximum: 20 }
  validates :introduction, length: {maximum: 50 }

  has_many :active_relationships, class_name: "Relationship",foreign_key:"follower_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship",foreign_key:"followed_id",dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def User.search(search, user_or_book, how_search)
    if user_or_book == "1"
        if how_search == "1"
            User.where(['name LIKE ?', "#{search}"])
        elsif how_search == "2"
            User.where(['name LIKE ?', "#{search}%"])
        elsif how_search == "3"
            User.where(['name LIKE ?', "%#{search}"])
        elsif how_search == "4"
            User.where(['name LIKE ?', "%#{search}%"])
        else
            User.all
        end
    end
  end
end

