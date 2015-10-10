require 'stateoscope/graph'
require 'stateoscope/integration/base'

require 'stateoscope/integration/aasm'

module Stateoscope
  module Integration
    def self.new_for(klass, state_machine_name)
      if klass.ancestors.include?(::AASM)
        ::Stateoscope::Integration::AASM.new(klass, state_machine_name)
      else
        fail MissingIntegrationError, 'unsupported state machine implementation'
      end
    end
  end
end
