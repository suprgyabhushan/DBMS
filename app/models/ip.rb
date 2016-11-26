class Ip < ActiveRecord::Base
  belongs_to :domain
  has_many :stakes
  has_many :ip_comms
  has_many :users, through: :stakes, as: :stakeholders
  has_many :faculties, through: :ip_comms, as: :ip_committee
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  accepts_nested_attributes_for :stakes, :reject_if => :all_blank , :allow_destroy =>true
  accepts_nested_attributes_for :users

  before_validation :set_status
  # after_save :set_stakes
  after_create :set_ip_committee
  before_save :set_ip_status
  # after_create :total
  validate do
    total2
  end
  def total2
    return self.stakes.sum(:percentage) == 100
  end
  def total
    if(self.stakes.sum(:percentage) == 100)
      puts(self.stakes.sum(:percentage))
    else
      puts(self.stakes.sum(:percentage))
      errors.add(:attr, 'Cant create.')
      raise ActiveRecord::Rollback
    end
  end

  def set_missing
    ip_com = Faculty.where(:ip_committee => true)
    ip_com.each do |com|
      if self.users.include?(com.user)
        self.update_attributes(:missing => 1)
      end
    end
  end


  def set_ip_committee
    ip_com = Faculty.where(:ip_committee => true)
    ip_com.each do |com|
      unless self.users.include?(com.user)
        self.ip_comms << IpComm.create(:faculty_id => com.id)
      end
    end
    self.update_attributes(:status => IP_COM_MISSING) if self.ip_comms.length < 3
  end



  def set_ip_status
    if self.ip_comms.length > 0 and self.ip_comms.length < 3
      self.status = IP_COM_MISSING
    end
    if self.ip_comms.length > 0
      flag = 0
      self.ip_comms.each do |com|
        flag = flag + 1 if com.vote == IP_ACCEPTED
        # flag = 2 if com.vote == nil
        # flag = 2 if com.vote == IP_REJECTED
      end
      if flag == self.ip_comms.length
        puts flag
        self.status = IP_ACCEPTED
      end
      # self.update_attributes(:status => IP_COM_DECLINED) if flag == IP_DECLINED
      # self.update_attributes(:status => IP_COM_REJECTED) if flag == IP_REJECTED
    end
  end

  def set_status
    self.status = IP_REVIEWING if self.status == nil
  end

  def accept
    flag = 0
    @ip.ip_committees.each do |comm|
      if comm.vote != IP_ACCEPTED
        flag = 1
      end
      if comm.vote == IP_REJECTED
        flag = 2
      end
    end
    if flag == 1
      @ip.status = IP_ACCEPTED
    end
    if flag == 2
      @ip.status = IP_REJECTED
    end
  end
end
