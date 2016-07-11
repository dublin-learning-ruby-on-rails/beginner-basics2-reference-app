class Post < ActiveRecord::Base
  belongs_to :user

  scope :title_containing, -> (substring) { where('title LIKE ?', "%#{substring}%") }

  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 10 }
end
