class Subject < ApplicationRecord
# #ONE TO ONE:
#   has_one :page

#ONE TO MANY:
  has_many :pages

  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
  scope :highest_position, lambda { order("position DESC").limit(1) }
  scope :sorted, lambda { order('position ASC')}
  scope :newest_first, lambda { order('created_at DESC') }
end
