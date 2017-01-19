module SlackerButler
  class About < SlackRubyBot::Commands::Base
    def self.address_info
      # get hostname
      hostname = Socket.gethostname
      # get private address
      ips = Socket.ip_address_list \
                  .select { |addr| addr.ipv4? && !addr.ipv4_loopback? } \
                  .map(&:ip_address)
      # public ips
      public_ip = Net::HTTP.get(URI(PUBLIC_URI_API))
      ["hostname: #{hostname}",
       "private: #{ips}",
       "public: #{public_ip}"].join("\n")
    end

    ABOUT = ["#{SlackerButler::CODE_NAME}(#{SlackerButler::VERSION})",
             'https://github.com/TieWei/slackerbutler'].join.freeze

    PUBLIC_URI_API = 'https://api.ipify.org/'.freeze

    ADDRESS_INFO = address_info.freeze

    match(/who\s+are\s+you/i) do |client, data, _match|
      client.say(channel: data.channel, text: ABOUT)
    end

    match(/where\s+are\s+you/i) do |client, data, _match|
      client.say(channel: data.channel, text: ADDRESS_INFO)
    end

    command 'about' do |client, data, _match|
      client.say(channel: data.channel, text: [ABOUT, ADDRESS_INFO].join("\n"))
    end
  end
end
