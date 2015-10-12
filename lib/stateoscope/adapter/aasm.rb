module Stateoscope
  module Adapter
    class AASM < Base

      def build_graph
        add_initial_state
        add_states
        add_transitions
        graph.detect_final_states!
      end

      def full_state_machine_name
        [
          'aasm',
          klass.name,
          state_machine_name
        ].compact.join('-').dasherize
      end

      private

      def state_machine
        klass.aasm(state_machine_name.presence)
      end

      def add_initial_state
        graph.initial_state = state_machine.initial_state.to_s
      end

      def add_states
        state_machine.states.each do |state|
          graph.add_state(state.name.to_s)
        end
      end

      def add_transitions
        state_machine.events.each do |event|
          event.transitions.each do |transition|
            graph.add_transition(transition.from.to_s, transition.to.to_s, event.name.to_s)
          end
        end
      end
    end
  end
end
