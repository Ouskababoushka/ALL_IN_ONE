class CreateResultItems < ActiveRecord::Migration[7.0]
  def change
    create_table :result_items do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :image_url
      t.datetime :posted_at
      t.string :item_type
      t.string :city
      t.string :hosted_url
      t.string :currency
      t.string :hosted_website

      t.timestamps
    end
  end
end
