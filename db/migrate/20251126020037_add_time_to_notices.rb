class AddTimeToNotices < ActiveRecord::Migration[7.1]
  def change
    add_column :notices, :start_time, :time
    add_column :notices, :end_time, :time
  end
end
