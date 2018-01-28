class CreateHeadings < ActiveRecord::Migration[5.0]
  def change
    create_table :headings do |t|
      t.integer :user_id
      t.text :original_text
      t.text :tags, array: true, default: []

      t.timestamps
    end
    add_index :headings, :user_id
  end
end
