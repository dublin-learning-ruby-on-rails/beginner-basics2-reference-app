class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  scope :title_containing, -> (substring) { where('title LIKE ?', "%#{substring}%") }

  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 10 }
end
