class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :location
      t.references :organizer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
