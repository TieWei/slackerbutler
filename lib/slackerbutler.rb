$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'net/http'
require 'slack-ruby-bot'
require 'socket'
require 'yaml'

require 'slackerbutler/version'
require 'slackerbutler/commands'
require 'slackerbutler/butler'
require 'slackerbutler/bot'
require 'slackerbutler/help'

SlackerButler.run!
