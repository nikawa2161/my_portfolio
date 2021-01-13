class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :likes, dependent: :destroy
   has_many :favorite_articles, through: :likes, source: :article
   has_one :profile, dependent: :destroy

   has_many :relationships, dependent: :destroy
   has_many :followings, through: :relationships, source: :company

   has_many :rooms

   delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def follow!(company)
    company_id = get_compay_id(company)

    relationships.create!(company_id: company_id)
  end

  def unfollow!(company)
    company_id = get_compay_id(company)
    relation = relationships.find_by!(company_id: company_id)
    relation.destroy!
  end

  def has_followed?(company)
    relationships.exists?(company_id: company.id)
  end

  private
  def get_compay_id(company)
    if company.is_a?(Company)
      company.id
    else
      company
    end
  end
end
