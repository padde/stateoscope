require 'spec_helper'

RSpec.describe Stateoscope::Adapter::Base do
  describe '.handle?' do
    subject { described_class }
    it { is_expected.to have_abstract_method(:handle?) }
  end

  describe '#initialize' do
    it 'initializes a graph' do
      adapter = described_class.new
      expect(adapter.graph).to be_a(Stateoscope::Graph)
    end
  end

  describe '#build_graph' do
    it { is_expected.to have_abstract_method(:build_graph) }
  end

  describe '#full_state_machine_name' do
    it { is_expected.to have_abstract_method(:full_state_machine_name) }
  end
end
