class AddNextSelectionToCorporates < ActiveRecord::Migration[6.0]
  def change
    add_column :corporates, :next_selection, :string
  end
end
