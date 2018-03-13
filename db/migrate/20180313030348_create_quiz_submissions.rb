class CreateQuizSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_submissions do |t|
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true
      t.jsonb :answers

      t.timestamps
    end
  end
end
