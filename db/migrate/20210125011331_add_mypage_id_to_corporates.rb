class AddMypageIdToCorporates < ActiveRecord::Migration[6.0]
  def change
    add_column :corporates, :mypage_id, :string
  end
end
