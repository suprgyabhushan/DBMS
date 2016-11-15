class Ip < ActiveRecord::Base
  belongs_to :domain
  has_many :stakes
  has_many :ip_comms
  has_many :users, through: :stakes, as: :stakeholders
  has_many :faculties, through: :ip_comms, as: :ip_committee
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  accepts_nested_attributes_for :stakes, :reject_if => :all_blank , :allow_destroy =>true
  accepts_nested_attributes_for :users


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
