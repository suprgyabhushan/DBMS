class Organisation < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :stakes, as: :stakeholders
  has_many :licences, as: :licencee
  has_many :ips, through: :stakes
end
