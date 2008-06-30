require 'comment_notifier'
require 'thread'

class CommentEmailObserver < ActiveRecord::Observer 
  observe Comment

  def after_save( comment )
    puts "start after_save" if CommentNotifier.debug_plugin
    Thread.new( comment ) do |cmt|
      CommentNotifier::deliver_comment_added( cmt )
    end
    puts "end after_save" if CommentNotifier.debug_plugin
  rescue
    # ignore?, comment notification shouldn't crash the blog
      puts "Went Boom due to: #{$!}"
  end
end
