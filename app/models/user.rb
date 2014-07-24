class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #A user can have many dev activities, their dev activities will be deleted if the user is deleted
  has_many :dev_activities, dependent: :destroy

  #For a user to sign up they much record there first name, surname and workgroup (and email - but that is also username)
  validates :first_name,  :presence => true
  validates :surname,  :presence => true
  validates :workgroup, :presence => true
end
