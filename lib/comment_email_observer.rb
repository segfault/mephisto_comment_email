require 'comment_notifier'

class CommentEmailObserver < ActiveRecord::Observer 
  observe Comment

  def after_save( comment )
    CommentNotifier::deliver_comment_added( comment )
  end
end
