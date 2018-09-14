module Conjoin
  class EnvString < String
    [:production, :development, :test, :staging].each do |env|
      define_method "#{env}?" do
        self == env.to_s
      end
    end

    def mounted?
      mounted_on_rails? ? true : false
    end

    def console?
      ENV['CONJOIN_CONSOLE'] ? true : false
    end

    private
      def mounted_on_rails?
        !!(defined?(::Rails) && defined?(::Warden) && defined?(::Devise))
      end
  end
end
