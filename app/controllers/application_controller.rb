class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    articles_path
  end

  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  def current_company
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end
end
