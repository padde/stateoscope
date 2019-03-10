require 'ruby-graphviz'

module Stateoscope
  Visualizer = Struct.new(:graph) do
    def parse_graph(current_state)
      @viz = GraphViz.new(:G, type: 'digraph')
      add_entry_point
      add_states(current_state)
      add_entry_point_transition
      add_state_transitions
    end

    def output(filename, output_format)
      @viz.output(output_format => filename)
    end

    private

    ENTRY_POINT = '__ENTRY_POINT__'

    def add_entry_point
      return unless graph.initial_state
      add_node(ENTRY_POINT, shape: 'circle', label: '', style: 'filled', color: 'black', fixedsize: true, width: 0.3)
    end

    def add_states(current_state)
      graph.states.each do |state|
        options = { peripheries: graph.final_state?(state) ? 2 : 1 }
        options[:color] = 'green' if state == current_state
        add_node(state, options)
      end
    end

    def add_entry_point_transition
      return unless graph.initial_state
      add_edge(ENTRY_POINT, graph.initial_state)
    end

    def add_state_transitions
      graph.transitions.each do |transition|
        add_edge(transition.from, transition.to, transition.event)
      end
    end

    def add_node(label, options = {})
      options.reverse_merge!(shape: 'ellipse')
      options.reverse_merge!(global_options)
      @viz.add_nodes(label, options)
    end

    def add_edge(from, to, label = nil, options = {})
      options.reverse_merge!(label: label) if label
      options.reverse_merge!(fontsize: 9, fontcolor: '#888888', labelangle: 45)
      options.reverse_merge!(global_options)
      @viz.add_edges(from, to, options)
    end

    def global_options
      {fontname: 'Helvetica', fontsize: 10}
    end
  end
end
