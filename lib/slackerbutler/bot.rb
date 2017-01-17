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
      config_yaml = (ENV['SLAKER_BUTLER_CONFIG'] ||
        File.expand_path('configs/dev.yml'))
      configs = symbolize_hash_keys(YAML.load_file(config_yaml))
      server = SlackerButler::Butler.new(configs)
      server
    end

    def symbolize_hash_keys(hash)
      hash_out = {}
      hash.each_pair do |k, v|
        hash_out[k.to_sym] = (v.is_a? Hash) ? symbolize_hash_keys(v) : v
      end
      hash_out
    end
  end
end
