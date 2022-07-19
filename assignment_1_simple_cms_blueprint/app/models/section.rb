class Section < ApplicationRecord

  has_many :section_edits
  has_many :admin_users, through: :section_edits
  #Since,AdminUser and Sections dont have direct relation but they are linked via SectionEdits
  # this will enable: AdminUser.sections will return associated sections
  scope :sorted, lambda { order('id ASC') }
  scope :invisible, -> { where( visible: false) }

  CONTENT_TYPES = ["Mythology", "Science", "History", "Architecture", "Science","Mathematics"].freeze

  validates_presence_of :name
  validates_length_of :name, maximum: 255

  validates_inclusion_of :content_type, in: CONTENT_TYPES, message: "Must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
end
