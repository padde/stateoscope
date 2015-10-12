require 'stateoscope/adapter_registry'

module Stateoscope
  module Adapter
    mattr_accessor :registry

    self.registry = AdapterRegistry.new

    def self.register(adapter)
      registry.register(adapter)
    end

    def self.new_for(klass, state_machine_name)
      adapter = registry.find!(klass, state_machine_name)
      adapter.new(klass, state_machine_name)
    end
  end
end

require 'stateoscope/adapter/base'
require 'stateoscope/adapter/aasm'
