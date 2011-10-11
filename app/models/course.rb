class Course < ActiveRecord::Base
  belongs_to :category
  has_attached_file :avatar,
                            :styles => {
                              :thumb => "75x75>",
                              :small => "150x150>"
                            }
  has_many :lessons
end
