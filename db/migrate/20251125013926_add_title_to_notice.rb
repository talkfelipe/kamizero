class AddTitleToNotice < ActiveRecord::Migration[7.1]
  def change
    add_column :notices, :title, :string
  end
end
