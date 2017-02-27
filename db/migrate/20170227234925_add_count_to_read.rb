class AddCountToRead < ActiveRecord::Migration[5.0]
  def change
    add_column :reads, :count, :integer
  end
end
