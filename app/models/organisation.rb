class Organisation < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :stakes, as: :stakeholders
end
