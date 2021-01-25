class AddMypagePasswordToCorporates < ActiveRecord::Migration[6.0]
  def change
    add_column :corporates, :mypage_password, :string
  end
end
