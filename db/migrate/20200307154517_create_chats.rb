class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.string :room_id
      t.text :content

      t.timestamps
    end
  end
end
