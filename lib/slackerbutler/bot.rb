module SlakerButler

  class << self
    def run!
        server.run
    end

    def server
      @server ||= config_server
    end

    private
    def config_server
      config_yaml = ENV['SLAKER_BUTLER_CONFIG'] || File.expand_path('configs/dev.yml')
      configs = symbolize_hash_keys(YAML.load_file(config_yaml))
      server = SlackerButler::Butler.new(configs)
      return server
    end

    def symbolize_hash_keys(hash)
        hash_out = {}
        hash.each_pair {|k, v| hash_out[k.to_sym] = (v.is_a? Hash)? symbolize_hash_keys(v):v }
        return hash_out
    end
  end
end