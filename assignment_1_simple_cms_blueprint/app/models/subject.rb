class Subject < ApplicationRecord
# #ONE TO ONE:
#   has_one :page

#ONE TO MANY:
  has_many :pages

  # scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
  scope :highest_position, lambda { order("position DESC").limit(1) }
  scope :sorted, lambda { order('position ASC')}
  scope :newest_first, lambda { order('created_at DESC') }
  # scope :search_subject_by_id, lambda { |subject_id| where(["id = ?"],subject_id) }

  validates_presence_of :name
  validates_length_of :name, maximum: 255
  # validates_presence_of vs. validates_length_of :minimum => 1
  # different error messages: "can't be blank" or "is too short"
  # validates_length_of allows strings with only spaces!
end
