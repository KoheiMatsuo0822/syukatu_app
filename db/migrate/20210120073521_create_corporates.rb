class CreateCorporates < ActiveRecord::Migration[6.0]
  def change
    create_table :corporates do |t|
      t.string :corp_name
      t.string :aspiration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :corporates, [:user_id, :updated_at]
  end
end
