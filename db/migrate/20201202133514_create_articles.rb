class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :company, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :Job_title, null: false
      t.string :employment, null: false
      t.string :education, null: false
      t.string :licensure, null: false
      t.string :documents, null: false
      t.string :selection, null: false
      t.string :screening_location, null: false

      t.timestamps
    end
  end
end
