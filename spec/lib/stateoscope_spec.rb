require 'spec_helper'

describe Stateoscope do
  describe '::VERSION' do
    it 'is present' do
      expect(described_class::VERSION).not_to be nil
    end
  end

  describe '.visualize' do
    DummyClass = Class.new

    context 'without options' do
      it 'runs a visualizer' do
        graph = double(Stateoscope::Graph)

        adapter = double(Stateoscope::Adapter::Base, build_graph: nil, graph: graph)
        expect(Stateoscope::Adapter).to receive(:new_for).with(DummyClass, nil).and_return(adapter)

        expect(described_class).to receive(:filename_for).with(adapter).and_return('filename')

        visualizer = double(Stateoscope::Visualizer, parse_graph: nil)
        expect(Stateoscope::Visualizer).to receive(:new).with(graph).and_return(visualizer)
        expect(visualizer).to receive(:output).with('filename')

        described_class.visualize(DummyClass)
      end
    end

    context 'with state_machine_name option' do
      it 'runs a visualizer' do
        graph = double(Stateoscope::Graph)

        adapter = double(Stateoscope::Adapter::Base, build_graph: nil, graph: graph)
        expect(Stateoscope::Adapter).to receive(:new_for).with(DummyClass, :foobar).and_return(adapter)

        expect(described_class).to receive(:filename_for).with(adapter).and_return('filename')

        visualizer = double(Stateoscope::Visualizer, parse_graph: nil)
        expect(Stateoscope::Visualizer).to receive(:new).with(graph).and_return(visualizer)
        expect(visualizer).to receive(:output).with('filename')

        described_class.visualize(DummyClass, state_machine_name: :foobar)
      end
    end
  end

  describe '.filename_for' do
    it 'generates a filename with the state machine name and utc timestamp' do
      adapter = object_double(
        Stateoscope::Adapter::Base.new,
        full_state_machine_name: 'foo'
      )
      Timecop.freeze(Time.new(2015, 1, 2, 3, 4, 5, 0)) do
        expect(described_class.filename_for(adapter)).to eq('foo-20150102030405')
      end
    end
  end
end
