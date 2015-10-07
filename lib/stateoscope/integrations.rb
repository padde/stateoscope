require 'stateoscope/graph'
require 'stateoscope/integrations/aasm'

module Stateoscope
  module Integrations
    def self.new_for(klass, state_machine_name)
      if klass.ancestors.include?(::AASM)
        ::Stateoscope::Integrations::AASM.new(klass, state_machine_name)
      else
        fail NotImplementedError, "unsupported state machine implementation"
      end
    end
  end
end
