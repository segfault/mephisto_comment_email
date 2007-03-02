# $Id$
module Mephisto::Plugins
  class CommentEmail < Mephisto::Plugin
    author 'Mark Guzman'
    version 'r$Rev$'.gsub( /(\$Rev:\s+)|(\s+\$)/, "" )
    notes "Sends an email with details when a comment is posted"
    homepage "http://hasno.info/2006/11/11/mephisto-plugins"
    
    
    class Schema < ActiveRecord::Migration
      def self.install
      end

      def self.uninstall
      end
    end
  end
end
