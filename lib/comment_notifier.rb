class CommentNotifier < ActionMailer::Base
  @@mail_prefix = "(blog)"
  @@mail_from_prefix = "Mephisto Blog"
  @@mail_from = nil

  def comment_added( comment )
    mail_from = @@mail_from
    mail_from = comment.site.email unless mail_from
    from        "%s <%s>" % [ @@mail_from_prefix, mail_from ]
    recipients  comment.article.user.email
    subject     "%s %s posted a comment about \"%s\"" % [ @@mail_prefix, comment.author, comment.article.title ]
    body        "comment" => comment
  end

  def self.template_root
    File.dirname(__FILE__) + '/../views'
  end
end
