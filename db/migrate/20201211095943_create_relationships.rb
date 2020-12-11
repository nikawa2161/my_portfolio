class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user, null: false
      t.references :company, null: false

      t.timestamps
    end
  end
end
