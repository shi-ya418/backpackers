class AddNameToTag < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :tag, :string
  end
end
