class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  scope :filter_by_location, ->(location) { where(location: location) }
  scope :filter_by_age1, ->(age1) { where("age >= #{age1}") }
  scope :filter_by_age2, ->(age2) { where("age <= #{age2}") }
  scope :filter_by_gender, ->(gender) { where(gender: gender) }
  scope :filter_by_sports, ->(sports) { where(users_sports: sports) }
  scope :filter_by_weekdays, ->(days) { where(users_weekdays: days) }
  scope :filter_by_nickname, ->(nickname) { where(nickname: nickname) }
  scope :filter_by_gym, ->(gym) { where(gym: gym) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships_as_user_one, dependent: :destroy, class_name: "Friendship", foreign_key: :user_one_id
  has_many :friendships_as_user_two, dependent: :destroy, class_name: "Friendship", foreign_key: :user_two_id
  has_many :messages, dependent: :destroy

  has_many :users_sports, dependent: :destroy
  has_many :sports, through: :users_sports

  has_many :users_weekdays, dependent: :destroy
  has_many :weekdays, through: :users_weekdays

  has_one_attached :photo, dependent: :destroy


  validates :email, uniqueness: true
  # def filter_by_location(location)
  #   where(location: location)
  # end

  # def filter_by_age(ages)
  #   where(age: ages)
  # end

  # def filter_by_sport(sport)
  #   where(sport: sport)
  # end

  # def filter_by_nickname(nickname)
  #   where(nickname: nickname)
  # end

  # def filter_by_gender(gender)
  #   where(gender: gender)
  # end
  belongs_to :gym, optional: true
end
