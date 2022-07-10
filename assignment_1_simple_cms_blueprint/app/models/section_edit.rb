class SectionEdit < ApplicationRecord

#This is the main JOIN table
  belongs_to :admin_user
  belongs_to :section
end
