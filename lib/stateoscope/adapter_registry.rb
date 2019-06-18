module Stateoscope
  AdapterRegistry = Struct.new(:adapters) do
    def initialize
      self.adapters = []
    end

    def register(adapter)
      adapters.unshift adapter
    end

    def find(klass, state_machine_name)
      adapters.find do |adapter|
        adapter.handle?(klass, state_machine_name)
      end
    end

    def find!(klass, state_machine_name)
      adapter = find(klass, state_machine_name)
      if adapter
        adapter
      else
        fail MissingAdapterError, 'unsupported state machine implementation'
      end
    end
  end
end
