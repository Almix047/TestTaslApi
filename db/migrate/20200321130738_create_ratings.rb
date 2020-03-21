class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :point, default: 0, null: false
      t.references :post, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
