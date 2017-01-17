module SlackerButler
  class Busy < SlackRubyBot::Commands::Base

    command 'busy?'

    def self.call(client, data, match)
        client.say(channel: data.channel, text: 'Time is money, friend')
    end

  end
end