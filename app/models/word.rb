class Word < ApplicationRecord
  self.inheritance_column = "not_sti"

  validates :word, presence: true
  validates :definition, presence: true
  
  def search_word
    word = Word.all

    if word.present?
      word = word.where(['word LIKE ?', word])
    else  
      word = word.where(['definition LIKE ?', definition])
    end
  end
end
