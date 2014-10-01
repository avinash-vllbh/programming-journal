# require 'spec_helper'
# require_relative '../../../ruby/Strings/trick_questions'
describe "#numberToText" do
  context "when passed valid integers" do
    it 'returns ten for number 10' do
      expect(numberToText(10)).to eq("ten")
    end
    it 'returns seventeen for number 17' do
      expect(numberToText(17)).to eq("seventeen")
    end
    it 'returns fifty five for number 55' do
      expect(numberToText(55)).to eq("fifty five")
    end
    it 'returns two hundred and fifty five for number 255' do
      expect(numberToText(255)).to eq("two hundred and fifty five")
    end
    it 'returns one hundred and ninety two for 192.101' do
      expect(numberToText(192.101)).to eq("one hundred and ninety two")
    end
  end
  context "when passed invalid numbers or strings" do
    it 'returns ArgumentError for strings' do
      expect(numberToText("test")).to be_instance_of(ArgumentError)
    end
  end
end

describe "#printAll" do
  let(:result) {(0..1000).to_a}
  it 'prints all numbers from 0 to 1000' do
    expect(printAll()).to eq(result)
  end
end