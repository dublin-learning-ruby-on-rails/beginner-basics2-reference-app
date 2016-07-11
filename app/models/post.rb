class Post < ActiveRecord::Base
  scope :enabled, -> { where(is_enabled: true) }
  scope :containing_batman, -> { where('title LIKE ?', '%Batman%') }

  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 10 }
end
