class AddNoticeToWord < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :notice, :string
  end
end
