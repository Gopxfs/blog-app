class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo,  default: "https://i.imgur.com/8Q5ZQ2x.png"
      t.text :bio, default: "I'm a new user"
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
