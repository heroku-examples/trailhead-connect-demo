class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.jsonb :answers
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
