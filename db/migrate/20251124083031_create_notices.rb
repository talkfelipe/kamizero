class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :category
      t.text :content
      t.date :date
      t.string :classroom
      t.string :grade
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
