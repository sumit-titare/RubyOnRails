class Page < ApplicationRecord

#belongs_to is a place where we should have foreign key defined for a modal.

# belongs_to :subject, foreign_key: "any_other_foreign_key_name" #If we don't follow RAILS convention, then we have to explicitly define foreign_key_name
# belongs_to: is not optional by default .i.e. While creating Page object, its parent Object "Subject" cannot be blank.
  belongs_to :subject
  has_many :sections

  #MANY TO MANY:(Simple)
  has_and_belongs_to_many :admin_users

  scope :sorted , lambda { order('id ASC') }
  # scope :search_subject, -> (subject_id) do
  #   Subject.search_subject_by_id(subject_id)
  # end
  scope :invisible, lambda { where(visible:false) }

  #validations
  # use validates_presence_of with validates_length_of to disallow spaces, because validates_length_of considers blank_space as 1 character.
  validates_presence_of :name
  validates_length_of :name, maximum: 255

  validates_presence_of :permalink
  validates_length_of :permalink, within: 3..255
  validates_uniqueness_of :permalink
  # for unique values by subject use ":scope => :subject_id"
end
