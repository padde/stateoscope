require 'stateoscope/adapter/base'

require 'stateoscope/adapter/aasm' if defined?(::AASM)

module Stateoscope
  module Adapter
    def self.new_for(klass, state_machine_name)
      if klass.inherits_from?('::AASM')
        ::Stateoscope::Adapter::AASM.new(klass, state_machine_name)
      else
        fail MissingAdapterError, 'unsupported state machine implementation'
      end
    end
  end
end
