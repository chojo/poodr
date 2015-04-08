require 'spec_helper'

module Leprechaun

  describe Drawing do
    describe "#draw" do
      let(:draw) { Leprechaun::Drawing.new.draw }

      it 'has a version number' do
        expect(Leprechaun::VERSION).not_to be nil
      end

      it "returns an array with 6 elements" do
        expect(draw).to be_an Array
        expect(draw.count).to eq(6)
      end

      it 'contains only numbers' do
        # def is_number?
        #   draw.all? { |x| x.is_a? Integer  }
        # end
        # expect(is_number?).to eq(true)
        draw.each do |drawing|
          expect(drawing).to be_a Integer
        end
      end

      it 'each element is less than 50' do
        draw.each do |drawing|
          expect(drawing).to be < 50
        end
      end

    end
  end
end
