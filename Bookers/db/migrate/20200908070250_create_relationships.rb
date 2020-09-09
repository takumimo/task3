class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.timestamps
      add_index :relationships, :follower_id
      add_index :relationships, :followed_id
      add_index :relationships, [:follower_id, :followed_id], unique: true
    end
  end
end
