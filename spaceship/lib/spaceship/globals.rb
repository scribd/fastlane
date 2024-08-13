module Spaceship
  class Globals
    class << self
      attr_writer(:check_session)
      attr_writer(:exit_after_sending_2fa)
      attr_writer(:resume_with_2fa)
    end

    # if spaceship is run with a FastlaneCore available respect the global state there
    # otherwise fallback to $verbose
    def self.verbose?
      if Object.const_defined?("FastlaneCore")
        return FastlaneCore::Globals.verbose? # rubocop:disable Require/MissingRequireStatement
      end
      return $verbose
    end

    # if spaceship is run with the --check_session flag this value will be set to true
    def self.check_session
      return @check_session
    end

    # if spaceship is run with the --exit_after_sending_2fa flag this value will be set to true
    def self.exit_after_sending_2fa
      return @exit_after_sending_2fa
    end

    # if spaceship is run with the --resume_with_2fa flag this value will be set to true
    def self.resume_with_2fa
      return @resume_with_2fa
    end
  end
end
