class Stake < ActiveRecord::Base
  belongs_to :ip
  belongs_to :stakeholder, :polymorphic => true
end
