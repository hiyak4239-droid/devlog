class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :summary
      t.string :category
      t.string :tags
      t.boolean :published, default: false, null: false

      t.timestamps
    end
  end
end
