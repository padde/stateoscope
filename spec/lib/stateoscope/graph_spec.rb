require 'spec_helper'

RSpec.describe Stateoscope::Graph do
  describe '#initialize' do
    it 'initializes initial_state' do
      expect(subject.initial_state).to eq(nil)
    end

    it 'initializes states' do
      expect(subject.states).to eq([])
    end

    it 'initializes final_states' do
      expect(subject.final_states).to eq([])
    end

    it 'initializes transitions' do
      expect(subject.transitions).to eq([])
    end
  end

  describe '#add_state' do
    it 'adds a state' do
      expect do
        subject.add_state('state')
      end.to change { subject.states }.from([]).to(['state'])
    end
  end

  describe '#add_transition' do
    it 'adds a transition' do
      expect do
        subject.add_transition('from_state', 'to_state', 'event')
      end.to change { subject.transitions.size }.from(0).to(1)
    end

    it 'builds a transition' do
      subject.add_transition('from_state', 'to_state', 'event')
      transition = subject.transitions.first
      expect(transition.from).to eq('from_state')
      expect(transition.to).to eq('to_state')
      expect(transition.event).to eq('event')
    end
  end

  describe '#detect_final_states!' do
    it 'detects the final states' do
      subject.add_state('a')
      subject.add_state('b')
      subject.add_state('c')
      subject.add_state('d')
      subject.add_transition('a', 'b')
      subject.add_transition('b', 'c')
      subject.add_transition('b', 'd')

      # a --> b --> c
      #       \
      #        `--> d

      subject.detect_final_states!
      expect(subject.final_states).to match_array(['c', 'd'])
    end
  end

  describe '#final_state?' do
    before do
      subject.final_states = ['c']
    end

    it 'determines whether a state is non-final' do
      expect(subject.final_state?('a')).to be_falsy
    end

    it 'determines whether a state is final' do
      expect(subject.final_state?('c')).to be_truthy
    end
  end
end
