class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :description
      t.string :pronoun
      t.string :image_url

      t.timestamps
    end
  end
end
