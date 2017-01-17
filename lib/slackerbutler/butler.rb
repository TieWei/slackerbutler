module SlackerButler
  class Butler < SlackRubyBot::Server

    attr_reader :commands_configs

    def initialize(configs={})
      @commands_configs = configs[:commands]
      super configs[:slack]

    end

    # register events from there.
  end
end