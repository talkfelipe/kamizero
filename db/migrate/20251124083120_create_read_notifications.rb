class CreateReadNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :read_notifications do |t|
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.bigint :notification_id
      t.string :notification_type

      t.timestamps
    end

    add_index :read_notifications, [:notification_type, :notification_id]
  end
end
