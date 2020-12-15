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

 
  
end
