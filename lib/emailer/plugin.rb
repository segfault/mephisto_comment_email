# $Id$
module MephistoPlugins
  class CommentEmail < MephistoPlugin
    author 'Mark Guzman'
    version '$Rev$'.gsub( "Rev: ", "" )
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
