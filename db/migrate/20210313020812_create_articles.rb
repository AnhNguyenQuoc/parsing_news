class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, allow_null: false
      t.string :url, allow_null: false
      t.text :content

      t.timestamps
    end
  end
end
