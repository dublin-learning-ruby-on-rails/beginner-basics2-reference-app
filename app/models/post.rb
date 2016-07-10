class Post < ActiveRecord::Base
  belongs_to :user
  has_many :attachments, dependent: :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 10 }
end
