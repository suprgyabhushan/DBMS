class Licence < ActiveRecord::Base
  belongs_to :licencee, polymorphic: true
  belongs_to :ip
end
