class User < ApplicationRecord # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_user_number, if: -> { !user_number.present? }

  has_many :owned_servers, class_name: "Server", foreign_key: "owner_id"

  private

  def set_user_number
    other_users_with_same_username = User.where("lower(username) like lower(?)", "%#{username}%")
    self.user_number = other_users_with_same_username.count + 1
  end
end
