# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe Offence do
      it 'has a few required attributes' do
        offence = Offence.new(:convention, 1, 'message', 'CopName')

        expect(offence.severity).to eq(:convention)
        expect(offence.line_number).to eq(1)
        expect(offence.message).to eq('message')
        expect(offence.cop_name).to eq('CopName')
      end

      it 'overrides #to_s' do
        offence = Offence.new(:convention, 1, 'message', 'CopName')

        expect(offence.to_s).to eq('C:  1: message')
      end

      it 'does not blow up if a message contains %' do
        offence = Offence.new(:convention, 1, 'message % test', 'CopName')

        expect(offence.to_s).to eq('C:  1: message % test')
      end

      it 'redefines == to compare offences based on their contents' do
        o1 = Offence.new(:test, 1, 'message', 'CopName')
        o2 = Offence.new(:test, 1, 'message', 'CopName')

        expect(o1 == o2).to be_true
      end
    end
  end
end