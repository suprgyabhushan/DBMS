class Stake < ActiveRecord::Base
  belongs_to :user
  belongs_to :ip
  accepts_nested_attributes_for :user, :reject_if => :all_blank, :allow_destroy =>true
end
