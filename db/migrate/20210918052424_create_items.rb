class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.string :image_name

      t.timestamps
    end
  end
end
