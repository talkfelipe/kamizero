class ChangeDefaultValueOfStatusToFalse < ActiveRecord::Migration[7.1]
  def change
    change_column :read_notifications, :status, :boolean, default: false
  end
end
