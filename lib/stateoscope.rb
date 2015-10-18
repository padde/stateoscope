require 'active_support'
require 'active_support/core_ext'

require 'stateoscope/core_ext'
require 'stateoscope/version'
require 'stateoscope/errors'
require 'stateoscope/adapter'
require 'stateoscope/visualizer'

require 'stateoscope/railtie' if defined?(Rails)

module Stateoscope
  def self.visualize(klass, options = {})
    state_machine_name = options.fetch(:state_machine_name, nil)
    adapter = Adapter.new_for(klass, state_machine_name)
    adapter.build_graph
    filename = options.fetch(:filename, filename_for(adapter))
    Visualizer.new(adapter.graph).output(filename)
  end

  def self.filename_for(adapter)
    "#{adapter.full_state_machine_name}-#{Time.now.utc.strftime('%Y%m%d%H%M%S')}"
  end
end
