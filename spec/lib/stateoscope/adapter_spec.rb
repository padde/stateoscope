require 'spec_helper'

RSpec.describe Stateoscope::Adapter do
  around do |example|
    old = described_class.registry
    described_class.registry = Stateoscope::AdapterRegistry.new
    example.call
    described_class.registry = old
  end

  describe '.register' do
    it 'registers the given adapter with the registry' do
      adapter = double(Stateoscope::Adapter::Base)
      expect(described_class.registry).to receive(:register).with(adapter)
      described_class.register(adapter)
    end
  end

  describe '.new_for' do
    it 'finds and instantiates an adapter from the registry' do
      klass = Class.new
      state_machine_name = :foo

      wrong_adapter = class_double(Stateoscope::Adapter::Base, new: :wrong)
      expect(wrong_adapter).to receive(:handle?).with(klass, state_machine_name).and_return(false)
      described_class.register(wrong_adapter)

      correct_adapter = class_double(Stateoscope::Adapter::Base, new: :correct)
      expect(correct_adapter).to receive(:handle?).with(klass, state_machine_name).and_return(true)
      described_class.register(correct_adapter)

      expect(described_class.new_for(klass, state_machine_name)).to eq(:correct)
    end
  end
end
