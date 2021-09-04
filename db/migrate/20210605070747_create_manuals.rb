class CreateManuals < ActiveRecord::Migration[6.0]
  def change
    create_table :manuals do |t|
      t.string :title, null: false
      t.text :heading, null: false
      t.text :text, null: false
      t.text :image_url
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
