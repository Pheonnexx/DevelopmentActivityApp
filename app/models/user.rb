class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #A user can have many dev activities, their dev activities will be deleted if the user is deleted
  belongs_to :role
  has_many :dev_activities, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :skills, :through => :user_skills
  has_one  :linemanager
  has_many :users_linemanagers
  has_many :linemanagers, :through => :users_linemanagers

  accepts_nested_attributes_for :users_linemanagers,
      :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }, :allow_destroy => true



  #For a user to sign up they much record there first name, surname and workgroup (and email - but that is also username)
  validates :first_name,  :presence => true
  validates :surname,  :presence => true
  validates :role_id,  :presence => true

        #This is temporary code to encrypt passwords - will be removed when all users are in database

      def valid_password?(password)
        if self.password_temp.present?
          if password == self.password_temp
            self.password = password
            self.password_temp = nil
            self.save!
            true
          else
            false
          end
        else
          super
        end
      end

      def reset_password!(*args)
        self.password_temp = nil
        super
      end

      #Temp as above - this is the command to run
      #users = User.where("password_temp"!=''); users.each do |i|; i.valid_password?(i.password_temp); end
end
