class Company < ActiveRecord::Base
  has_many :users
  has_many :notes
  has_attached_file :logo,
                          :styles => {
                            :small => "150x150>"
                          }
end
