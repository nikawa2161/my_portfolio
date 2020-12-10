class CreateRelatinships < ActiveRecord::Migration[6.0]
  def change
    create_table :relatinships do |t|
      t.references :following, null: false, foreign_key: { to_table: :companies }
      t.references :follower, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
