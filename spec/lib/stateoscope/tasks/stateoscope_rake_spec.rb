require 'spec_helper'

require 'rake'
require 'pathname'

RSpec.describe 'rake stateoscope' do
  let(:rake) { Rake::Application.new }

  before do
    gem_root = Pathname.new(File.expand_path('../../../../../', __FILE__))
    Rake.application = rake
    Rake.application.rake_require('lib/tasks/stateoscope', [gem_root], [])
    Rake::Task.define_task(:environment)
  end

  describe ':visualize' do
    DummyClass = Class.new

    context 'with no arguments' do
      it 'raises an error indication the missing argument' do
        expect do
          rake['stateoscope:visualize'].invoke
        end.to raise_error(ArgumentError).with_message('missing required argument <class>')
      end
    end

    context 'with one argument' do
      it 'invokes Stateoscope.visualize with the supplied class' do
        stateoscope = class_double('Stateoscope').as_stubbed_const
        allow(stateoscope).to receive(:visualize)
        rake['stateoscope:visualize'].invoke('DummyClass')
        expect(stateoscope).to have_received(:visualize).with(DummyClass, state_machine_name: nil)
      end
    end

    context 'with two arguments' do
      it 'invokes Stateoscope.visualize with the supplied class and state_machine_name' do
        stateoscope = class_double('Stateoscope').as_stubbed_const
        allow(stateoscope).to receive(:visualize)
        rake['stateoscope:visualize'].invoke('DummyClass', 'foo')
        expect(stateoscope).to have_received(:visualize).with(DummyClass, state_machine_name: 'foo')
      end
    end
  end
end
