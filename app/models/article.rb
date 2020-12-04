class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :Job_title, presence: true
  validates :employment, presence: true
  validates :education, presence: true
  validates :licensure, presence: true
  validates :documents, presence: true
  validates :selection, presence: true
  validates :screening_location, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
