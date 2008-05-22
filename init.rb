require 'comment_email_observer'
ActiveRecord::Base.observers << :comment_email_observer

