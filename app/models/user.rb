class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one :profile, dependent: :destroy
  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def birthday
    profile&.birthday
  end

  def gender
    profile&.gender
  end

  def prepare_profile
    profile || build_profile
  end
end
