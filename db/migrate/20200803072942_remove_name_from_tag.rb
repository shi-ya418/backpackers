class RemoveNameFromTag < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :tag, :string
  end
end
