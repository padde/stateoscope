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
    adapter = Adapter.new_for(klass, options[:state_machine_name])
    adapter.build_graph

    visualizer = Visualizer.new(adapter.graph)
    visualizer.parse_graph(options[:current_state])

    output_format = options.fetch(:format, 'pdf')
    filename = filename_for(adapter, output_format)
    filename = File.join(options[:dir], filename) if options[:dir].present?

    visualizer.output(filename, output_format)
    filename
  end

  def self.filename_for(adapter, output_format)
    "#{adapter.full_state_machine_name}-#{Time.now.utc.strftime('%Y%m%d%H%M%S')}.#{output_format}"
  end
end
