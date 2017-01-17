$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'slack-ruby-bot'
require 'yaml'

require 'slackerbutler/version'
require 'slackerbutler/commands'
require 'slackerbutler/butler'
require 'slackerbutler/bot'
require 'slackerbutler/help'

SlakerButler.run!
