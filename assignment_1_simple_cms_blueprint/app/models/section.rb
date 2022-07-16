class Section < ApplicationRecord

  has_many :section_edits
  has_many :admin_users, through: :section_edits
  #Since,AdminUser and Sections dont have direct relation but they are linked via SectionEdits
  # this will enable: AdminUser.sections will return associated sections
  scope :sorted, lambda { order('id ASC') }
  scope :invisible, -> { where( visible: false) }
end
