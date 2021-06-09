class CreateManuals < ActiveRecord::Migration[6.0]
  def change
    create_table :manuals do |t|
      t.string :job, null: false
      t.string :heading, null: false
      t.text :text, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end