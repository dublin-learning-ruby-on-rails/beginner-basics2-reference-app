class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 10 }

  before_validation :strip_trailing_whitespaces
  after_save :notify_user

  private

  def strip_trailing_whitespaces
    self.title.strip! if self.title.present?
    self.content.strip! if self.content.present?
  end

  def notify_user
    Notifier.saved_post_notification('myemail@example.com', self.id).deliver_now
  end
end
