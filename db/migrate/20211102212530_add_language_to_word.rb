class AddLanguageToWord < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :language, :string
  end
end
