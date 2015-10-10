module Stateoscope
  module Integration
    class Base < Struct.new(:klass, :state_machine_name)
      def graph
        fail AbstractMethodError
      end

      def full_state_machine_name
        fail AbstractMethodError
      end
    end
  end
end
