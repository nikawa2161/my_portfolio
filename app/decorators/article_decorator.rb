# frozen_string_literal: true

module ArticleDecorator
  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def display_updated_at
    I18n.l(self.updated_at, format: :default)
  end

  def like_count
    likes.count
  end
end
