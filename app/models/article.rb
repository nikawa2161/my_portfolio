class Article < ApplicationRecord
  has_one_attached :eyecatch

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

end
