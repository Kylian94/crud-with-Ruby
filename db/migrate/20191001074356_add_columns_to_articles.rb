class AddColumnsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :category_id, :string
    add_column :articles, :—force, :string
  end
end
