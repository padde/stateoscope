require 'stateoscope/graph'

module Stateoscope
  module Adapter
    class Base
      attr_accessor :klass, :state_machine_name, :graph
      def self.handle?(_klass, _state_machine_name)
        fail AbstractMethodError
      end

      def initialize(klass, state_machine_name)
        self.klass = klass
        self.state_machine_name = state_machine_name
        self.graph = Graph.new
      end

      def build_graph
        fail AbstractMethodError
      end

      def full_state_machine_name
        fail AbstractMethodError
      end
    end
  end
end
