class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end

    add_index :friendships, :user_id
    add_index :friendships, :friend_id
  end
end
