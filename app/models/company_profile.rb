class CompanyProfile < ApplicationRecord
  belongs_to :company
  has_one_attached :avatar
end
