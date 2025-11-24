class CreateReadNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :read_notifications do |t|
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :notice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
