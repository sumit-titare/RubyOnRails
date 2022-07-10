class AdminUser < ApplicationRecord
#MANY to MANY relation:(Simple)
  has_and_belongs_to_many :pages

#MANY TO MANY : (RICH FORMAT)
  has_many :section_edits
  has_many :sections, through: :section_edits
end
