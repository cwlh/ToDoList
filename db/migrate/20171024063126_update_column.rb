class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :lists, :name, :title
  end
end
