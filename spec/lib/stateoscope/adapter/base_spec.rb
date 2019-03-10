require 'spec_helper'

RSpec.describe Stateoscope::Adapter::Base do
  describe '.handle?' do
    subject { described_class }
    it { is_expected.to have_abstract_method(:handle?) }
  end

  class Dummy; end

  describe '#initialize' do
    it 'initializes a graph' do
      adapter = described_class.new Dummy, "DummyState"
      expect(adapter.graph).to be_a(Stateoscope::Graph)
    end
  end

  describe '#build_graph' do
    subject { described_class.new(Dummy, "State") }
    it { is_expected.to have_abstract_method(:build_graph) }
  end

  describe '#full_state_machine_name' do
    subject { described_class.new(Dummy, "OK") }
    it { is_expected.to have_abstract_method(:full_state_machine_name) }
  end
end
