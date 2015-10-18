require 'stateoscope/graph'

module Stateoscope
  module Adapter
    Base = Struct.new(:klass, :state_machine_name, :graph) do
      def self.handle?(_klass, _state_machine_name)
        fail AbstractMethodError
      end

      def initialize
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
