require 'stateoscope/graph'

module Stateoscope
  module Adapter
    Base = Struct.new(:klass, :state_machine_name, :graph) do
      def initialize
        self.graph = Graph.new
      end

      def graph
        build_graph
        graph
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
