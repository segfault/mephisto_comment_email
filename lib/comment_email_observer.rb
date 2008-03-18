require 'comment_notifier'
require 'thread'

puts "loading!"
class CommentEmailObserver < ActiveRecord::Observer 
  observe Comment

  def after_save( comment )
    puts "%"*30
    puts "IN after_save"
    puts "%"*30
    Thread.new( comment ) do |cmt|
      puts "!"*40
      puts "IN THREAD BLOCK"
      puts "!"*40
      CommentNotifier::deliver_comment_added( cmt )
    end
  rescue
    # ignore?, comment notification shouldn't crash the blog
      puts "!*#"*20
      puts "Went Boom due to: #{$!}"
      puts "!*#"*20
  end
end
