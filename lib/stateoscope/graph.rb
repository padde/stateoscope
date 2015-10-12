require 'ostruct'

module Stateoscope
  class Graph
    attr_accessor :initial_state, :states, :final_states, :transitions

    def initialize
      self.states = []
      self.final_states = []
      self.transitions = []
    end

    def add_state(state)
      states << state
    end

    def add_transition(from, to, event = nil)
      transitions << OpenStruct.new(from: from, to: to, event: event)
    end

    def detect_final_states!
      self.final_states = states - transitions.map(&:from)
    end

    def final_state?(state)
      final_states.include?(state)
    end
  end
end
