class CommentNotifier < ActionMailer::Base
  @@blog_url = nil
  @@mail_prefix = "(blog)"
  @@mail_from_name = "Mephisto Blog"
  @@mail_from = nil
  @@mail_to = nil
  @@only_approved = false
  cattr_accessor :blog_url
  cattr_accessor :mail_prefix
  cattr_accessor :mail_from_name
  cattr_accessor :mail_from
  cattr_accessor :mail_to
  cattr_accessor :only_approved

  def comment_added( comment )
    puts "*"*20
    puts "IN comment_added"
    puts "*"*20

    return if (only_approved && !comment.approved?)
    return if (comment.created_at != comment.updated_at) # assuming we don't want to double post

    mail_from = @@mail_from
    mail_from = comment.site.email unless mail_from
    from         "%s <%s>" % [ @@mail_from_name, mail_from ]
    recipients   (mail_to || comment.article.user.email)
    subject      "%s %s posted a comment about \"%s\"" % [ @@mail_prefix, comment.author, comment.article.title ]
    body         "comment" => comment
    content_type "text/html"
  end

  def self.template_root
    File.dirname(__FILE__) + '/../views'
  end
end

require File.expand_path(File.dirname(__FILE__) + "/config.rb")
