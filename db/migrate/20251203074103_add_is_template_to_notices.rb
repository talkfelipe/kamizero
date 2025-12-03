class AddIsTemplateToNotices < ActiveRecord::Migration[7.1]
  def change
    add_column :notices, :is_template, :boolean, default: false
  end
end
