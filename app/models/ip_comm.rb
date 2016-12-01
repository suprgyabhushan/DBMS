class IpComm < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :ip
  after_save do
    self.ip.set_ip_status
  end
end
