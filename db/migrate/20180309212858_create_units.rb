class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :title
      t.text :description
      t.integer :time_estimate
      t.text :content

      t.timestamps
    end
  end
end
