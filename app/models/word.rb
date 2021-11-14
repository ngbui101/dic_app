class Word < ApplicationRecord
  self.inheritance_column = "not_sti"

  validates :word, presence: true
  validates :definition, presence: true
  
end
