class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :image_url
      t.references :unit, foreign_key: true

      t.timestamps
    end

    create_table :earned_badges do |t|
      t.datetime :earned_at
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
