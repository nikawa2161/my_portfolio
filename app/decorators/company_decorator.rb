# frozen_string_literal: true

module CompanyDecorator

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
