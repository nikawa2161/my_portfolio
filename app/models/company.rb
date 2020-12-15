class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy

  has_many :relationships, dependent: :destroy
  has_many :followers, through: :relationships, source: :user


  has_one :company_profile, dependent: :destroy

  def has_written?(article)
    articles.exists?(id: article.id)
  end

  def display_name
    company_profile&.company_name || self.email.split('@').first
  end

  def prepare_company_profile
    company_profile || build_company_profile
  end

  def avatar_image
    if company_profile&.avatar&.attached?
      company_profile.avatar
    else
      'default-avatar.png'
    end
  end
end
