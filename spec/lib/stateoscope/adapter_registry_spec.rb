require 'spec_helper'
require 'pry'

RSpec.describe Stateoscope::AdapterRegistry do
  describe '#register' do
    let(:adapter) { class_double(Stateoscope::Adapter::Base) }

    it 'registers an adapter' do
      subject.register(adapter)
      expect(subject.adapters).to eq([adapter])
    end
  end

  describe '#find' do
    DummyClass = Class.new

    before do
      adapters.each do |adapter|
        subject.register(adapter)
      end
    end

    context 'when a matching adapter exists' do
      let(:matching_adapter) do
        class_double(Stateoscope::Adapter::Base)
      end

      let(:adapters) do
        [
          class_double(Stateoscope::Adapter::Base, handle?: false),
          class_double(Stateoscope::Adapter::Base, handle?: false),
          matching_adapter
        ]
      end

      it 'finds the adapter' do
        expect(matching_adapter).to receive(:handle?).with(DummyClass, :foo).and_return(true)
        expect(subject.find(DummyClass, :foo)).to eq(matching_adapter)
      end
    end

    context 'when no matching adapter exists' do
      let(:adapters) do
        [
          class_double(Stateoscope::Adapter::Base, handle?: false),
          class_double(Stateoscope::Adapter::Base, handle?: false)
        ]
      end

      it 'returns nil' do
        expect(subject.find(DummyClass, :foo)).to eq(nil)
      end
    end
  end

  describe '#find!' do
    DummyClass = Class.new

    before do
      adapters.each do |adapter|
        subject.register(adapter)
      end
    end

    context 'when a matching adapter exists' do
      let(:matching_adapter) do
        class_double(Stateoscope::Adapter::Base)
      end

      let(:adapters) do
        [
          class_double(Stateoscope::Adapter::Base, handle?: false),
          class_double(Stateoscope::Adapter::Base, handle?: false),
          matching_adapter
        ]
      end

      it 'finds the adapter' do
        expect(matching_adapter).to receive(:handle?).with(DummyClass, :foo).and_return(true)
        expect(subject.find!(DummyClass, :foo)).to eq(matching_adapter)
      end
    end

    context 'when no matching adapter exists' do
      let(:adapters) do
        [
          class_double(Stateoscope::Adapter::Base, handle?: false),
          class_double(Stateoscope::Adapter::Base, handle?: false)
        ]
      end

      it 'raises an error' do
        expect { subject.find!(DummyClass, :foo) }.to(
          raise_error(Stateoscope::MissingAdapterError)
            .with_message('unsupported state machine implementation')
        )
      end
    end
  end

  describe 'registering multiple matching adapters' do
    let(:existing_adapter) { class_double(Stateoscope::Adapter::Base, handle?: true) }
    let(:new_adapter) { class_double(Stateoscope::Adapter::Base, handle?: true) }

    specify 'new adapter overrides the existing one' do
      subject.register(existing_adapter)
      subject.register(new_adapter)
      expect(subject.find!(Class.new, :foo)).to eq(new_adapter)
    end
  end
end
