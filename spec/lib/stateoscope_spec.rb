require 'spec_helper'

describe Stateoscope do
  describe '::VERSION' do
    it 'is present' do
      expect(described_class::VERSION).not_to be nil
    end
  end

  describe '.visualize' do
    pending
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
