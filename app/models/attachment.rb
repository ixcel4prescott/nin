class Attachment < ActiveRecord::Base
  attr_accessible :file
  
  mount_uploader :file, AttachmentUploader
  
  belongs_to :attachable, :polymorphic => true
end

