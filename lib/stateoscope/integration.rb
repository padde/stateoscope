require 'stateoscope/graph'
require 'stateoscope/integration/base'

require 'stateoscope/integration/aasm' if defined?(::AASM)

module Stateoscope
  module Integration
    def self.new_for(klass, state_machine_name)
      if class_inherits_from?(klass, '::AASM')
        ::Stateoscope::Integration::AASM.new(klass, state_machine_name)
      else
        fail MissingIntegrationError, 'unsupported state machine implementation'
      end
    end

    def self.class_inherits_from?(klass, superclass_name)
      return false unless const_defined?(superclass_name)
      klass.ancestors.include?(const_get(superclass_name))
    end
  end
end
