class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :image
      t.string :title
      t.boolean :is_visible ,default: false

      t.timestamps
    end
  end
end
