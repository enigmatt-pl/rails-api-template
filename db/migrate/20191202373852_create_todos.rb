class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.references :subscriber

      t.timestamps
    end
  end
end
