class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:microsoft_office365 , :google, :facebook]

  has_many :stakes, as: :stakeholder
  has_many :ips, through: :stakes
  accepts_nested_attributes_for :stakes
  has_one :student
  accepts_nested_attributes_for :student
  has_one :faculty
  accepts_nested_attributes_for :faculty
  has_one :collaborator
  accepts_nested_attributes_for :collaborator
  has_many :organisations

  def active_for_authentication?
    super && status?
  end

  def inactive_message
    if !status?
      :not_approved
    else
      super # Use whatever other message
    end
  end
  def self.types
    %w(Student Faculty Collaborator)
  end
  def self.from_omniauth(auth)
   if user = User.find_by_email(auth.info.email)
     user
   else
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user
       user.provider = auth.provider
       user.uid = auth.uid
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.name = auth.info.name
       user.status = 0
     end
   end
  end

end
