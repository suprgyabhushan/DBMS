class Ip < ActiveRecord::Base
  belongs_to :domain
  has_many :users, through: :stake, as: :stakeholders
  has_many :faculty, through: :ip_comm, as: :ip_committee

  def accept
    flag = 0
    @ip.ip_committees.each do |comm|
      if comm.vote != 1
        flag = 1
      end
    end
    if flag == 1
      @ip.status = ACCEPTED
    end
  end
end
