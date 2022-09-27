class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo,  default: "https://cdn-icons-png.flaticon.com/512/1159/1159797.png?w=740&t=st=1664309258~exp=1664309858~hmac=705ab1c49b60057e9dd8c91730e992f4b727b726801774c150f8916922ed039c"
      t.text :bio, default: "I'm a new user"
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
