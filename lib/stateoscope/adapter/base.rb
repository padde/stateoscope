module Stateoscope
  module Adapter
    Base = Struct.new(:klass, :state_machine_name) do
      def graph
        fail AbstractMethodError
      end

      def full_state_machine_name
        fail AbstractMethodError
      end
    end
  end
end
