class Page < ApplicationRecord

#belongs_to is a place where we should have foreign key defined for a modal.

# belongs_to :subject, foreign_key: "any_other_foreign_key_name" #If we don't follow RAILS convention, then we have to explicitly define foreign_key_name
# belongs_to: is not optional by default .i.e. While creating Page object, its parent Object "Subject" cannot be blank.
  belongs_to :subject

  #MANY TO MANY:(Simple)
  has_and_belongs_to_many :admin_users

  scope :sorted , lambda { order('id ASC') }
  # scope :search_subject, -> (subject_id) do
  #   Subject.search_subject_by_id(subject_id)
  # end
  scope :invisible, lambda { where(visible:false) }

end
