class AddReplyToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :reply, :text
  end
end
