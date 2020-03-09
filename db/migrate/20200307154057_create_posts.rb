class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :room
      t.string :user_id
      t.string :name_id

      t.timestamps
    end
  end
end
