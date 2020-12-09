class Article < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }
  validates :title, uniqueness: true
  validates :body, presence: true
  validates :body, uniqueness: true
  validates :Job_title, presence: true
  validates :employment, presence: true
  validates :education, presence: true
  validates :licensure, presence: true
  validates :documents, presence: true
  validates :selection, presence: true
  validates :screening_location, presence: true
  
  has_many :likes, dependent: :destroy
  belongs_to :company
  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def like_count
    likes.count
  end

end
