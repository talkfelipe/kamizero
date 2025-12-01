class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :category
      t.text :content
      t.date :date
      t.references :school, null: false, foreign_key: true
      t.references :classroom, null: true, foreign_key: true

      t.timestamps
    end
  end
end
