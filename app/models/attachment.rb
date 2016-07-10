class Attachment < ActiveRecord::Base
  belongs_to :post

  scope :description_containing, -> (substring) { where('description LIKE ?', "%#{substring}%") }

  mount_uploader :file, AttachmentUploader

  validates :file, presence: true
  validates :description, presence: true
end
