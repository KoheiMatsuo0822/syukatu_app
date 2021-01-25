class AddMypageUrlToCorporates < ActiveRecord::Migration[6.0]
  def change
    add_column :corporates, :mypage_url, :string
  end
end
