class CreateRelatinships < ActiveRecord::Migration[6.0]
  def change
    create_table :relatinships do |t|
      t.references :user, null: false
      t.references :company, null: false

      t.timestamps
    end
  end
end
