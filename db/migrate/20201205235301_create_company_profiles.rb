class CreateCompanyProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :company_profiles do |t|
      t.references :company, null: false
      t.string :company_name
      t.text :introduction
      t.string :address
      t.string :phone_number
      t.boolean :subscribed, default: false

      t.timestamps
    end
  end
end
