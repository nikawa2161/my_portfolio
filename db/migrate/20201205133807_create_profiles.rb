class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.string :last_name
      t.string :first_name
      t.string :kana_last_name
      t.string :kana_first_name
      t.text :introduction
      t.integer :gender
      t.date :birthday
      t.string :address
      t.string :phone_number
      t.boolean :subscribed, default: false
      t.timestamps
    end
  end
end
