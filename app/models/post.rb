class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 10 }
  has_many :attachments
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
end
