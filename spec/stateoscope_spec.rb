require 'spec_helper'

describe Stateoscope do
  it 'has a version number' do
    expect(Stateoscope::VERSION).not_to be nil
  end

  describe '.filename_for' do
    it 'generates a filename with the state machine name and utc timestamp' do
      integration = object_double(
        Stateoscope::Integration::Base.new,
        full_state_machine_name: 'foo'
      )
      Timecop.freeze(Time.new(2015, 1, 2, 3, 4, 5, 0)) do
        expect(described_class.filename_for(integration)).to eq('foo-20150102030405')
      end
    end
  end
end
