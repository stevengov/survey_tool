class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :question, null: false
      t.integer :yes_responses_count, null: false, default: 0
      t.integer :no_responses_count, null: false, default: 0

      t.timestamps
    end
  end
end
