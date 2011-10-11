class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :company
  has_and_belongs_to_many :roles
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :company_id, :email, :password, :password_confirmation, :remember_me, :role_ids

  def role?(role)
   return !!self.roles.find_by_name(role) 
   #return !!self.roles.find_by_name(role.to_s.camelize) 
  end
end
