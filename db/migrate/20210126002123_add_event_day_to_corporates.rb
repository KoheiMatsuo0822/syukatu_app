class AddEventDayToCorporates < ActiveRecord::Migration[6.0]
  def change
    add_column :corporates, :event_day, :date
  end
end
