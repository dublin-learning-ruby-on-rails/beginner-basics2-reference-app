class Notifier < ApplicationMailer
  def saved_post_notification(recipient_email, post_id)
    @post = Post.find(post_id)
    mail to: recipient_email, subject: 'Saved Post Notification'
  end
end
