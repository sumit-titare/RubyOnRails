# Content management system(CMS):

## Functionalities:

### 1. Public access : 
  - Visit CMS, About Us, Contact Us.
  - Sign Up for CMS.
  
### 2. Admin User access : 
  - All access of CMS.
  - Can add, update, delete : Subjects, Pages and Sections.
  
### 3. Model relations (#PR):
  - subject:
      - has_many -> pages
  - pages:
      - belongs_to :subject
      - has_many -> sections
      - has_and_belongs_to_many -> admin_users (MANY to MANY- Simple)
  - admin_user: 
      - has_and_belongs_to_many -> pages (MANY to MANY- Simple)
      - has_many :section_edits
      - has_many :sections, through: :section_edits (MANY to MANY- RichFormat)
  - section:
      - has_many :section_edits
      - has_many :admin_users, through: :section_edits
  - section_edit:
      - belongs_to :admin_user
      - belongs_to :section
  
  
  
  ![ror-640px](https://user-images.githubusercontent.com/104588236/180609043-db4a4770-63ce-426e-ab46-68eed7801c8f.gif)
