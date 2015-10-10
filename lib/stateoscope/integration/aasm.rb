module Stateoscope
  module Integration
    class AASM < Struct.new(:klass, :state_machine_name)
      def graph
        graph = Graph.new

        graph.initial_state = state_machine.initial_state.to_s

        state_machine.states.each do |state|
          graph.add_state(state.name.to_s)
        end

        state_machine.events.each do |event|
          event.transitions.each do |transition|
            graph.add_transition(transition.from.to_s, transition.to.to_s, event.name.to_s)
          end
        end

        graph.detect_final_states!

        graph
      end

      def full_state_machine_name
        [
          "aasm",
          klass.name,
          state_machine_name
        ].compact.join('-').dasherize
      end

      private

      def state_machine
        klass.public_send(:aasm, state_machine_name.presence)
      end
    end
  end
end
