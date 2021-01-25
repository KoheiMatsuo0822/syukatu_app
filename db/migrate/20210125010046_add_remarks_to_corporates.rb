class AddRemarksToCorporates < ActiveRecord::Migration[6.0]
  def change
    add_column :corporates, :remarks, :text
  end
end
