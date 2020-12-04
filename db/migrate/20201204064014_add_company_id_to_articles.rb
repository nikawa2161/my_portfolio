class AddCompanyIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :company
  end
end
