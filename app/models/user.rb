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

   delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def prepare_profile
    profile || build_profile
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

  
  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
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
