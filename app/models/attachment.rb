class Attachment < ActiveRecord::Base
  belongs_to :post

  mount_uploader :file, AttachmentUploader

  validates :file, presence: true
  validates :description, presence: true
end
