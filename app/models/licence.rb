class Licence < ActiveRecord::Base
  belongs_to :licencee, polymorphic: true
  belongs_to :ip
  mount_uploader :agreement, AttachmentUploader # Tells rails to use this uploader for this model.
end
