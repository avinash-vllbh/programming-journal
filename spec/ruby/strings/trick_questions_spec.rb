# require 'spec_helper'
# require_relative '../../../ruby/Strings/trick_questions'
describe "#numberToText" do
  context "when passed valid integers" do
    it "returns ten for number 10" do
      expect(numberToText(10)).to eq("ten")
    end
    it "returns seventeen for number 17" do
      expect(numberToText(17)).to eq("seventeen")
    end
    it "returns fifty five for number 55" do
      expect(numberToText(55)).to eq("fifty five")
    end
    it "returns two hundred and fifty five for number 255" do
      expect(numberToText(255)).to eq("two hundred and fifty five")
    end
    it "returns one hundred and ninety two for 192.101" do
      expect(numberToText(192.101)).to eq("one hundred and ninety two")
    end
  end
  context "when passed invalid numbers or strings" do
    it "returns ArgumentError for strings" do
      expect(numberToText("test")).to be_instance_of(ArgumentError)
    end
  end
end

describe "#romanToInteger" do
  context "when given valid roman numerical strings as input" do
    it "returns 8 for VIII" do
      expect(romanToInteger("VIII")).to eq(8)
    end
    it "returns 14 for XIV" do
      expect(romanToInteger("XIV")).to eq(14)
    end
    it "returns 59 for LIX" do
      expect(romanToInteger("LIX")).to eq(59)
    end
    it "returns 27 for XXVII" do
      expect(romanToInteger("XXVII")).to eq(27)
    end
    it "returns 96 for XCVI" do
      expect(romanToInteger("XCVI")).to eq(96)
    end
  end
  context "when given invalid roman numeral strings as input" do
    it "returns nil for empty string" do
      expect(romanToInteger("")).to be nil
    end
    it "raises error for invalid roman numerals" do
      expect(romanToInteger("XYVI")).to be_instance_of(NoMethodError)
    end
  end
end

describe "#longestSubString" do
  it "returns the correct size of the longest substring with unique chars" do
    expect(longestSubString("abcabcbb")).to eq(3)
  end
  it "returns the longest substring if an earilier found string less than it's length" do
    expect(longestSubString("hehellmnmnpqpqr")).to eq(4)
  end
  it "returns 1 if all chars are same" do
    expect(longestSubString("bbbb")).to eq(1)
  end
  it "can handle edge cases of string being empty" do
    expect(longestSubString("")).to eq(0)
  end
end

describe "#replaceMatchingPattern" do
  it "returns string after replacing it with matching pattern" do
    expect(replaceMatchingPattern("hellello", "ell", "x")).to eq("hxo")
  end
  it "returns string after replacing it with matching contiguous pattern" do
    expect(replaceMatchingPattern("abcdeffdfegabcabc", "abc", "X")).to eq("XdeffdfegX")
  end
  it "returns the same string if no match is found" do
    expect(replaceMatchingPattern("helloavi", "pqr", "x")).to eq("helloavi")
  end
end

describe "#countUnique" do
  let(:input) {%w(hi hello hw how are you hi hw heello)}
  let(:result) {7}
  it "returns the correct number of unique strings in a collection" do
    expect(countUnique(input)).to eq(result)
  end
  it "returns 1 if there is only single element in array" do
    expect(countUnique(["test"])).to eq(1)
  end
  it "returns 0 if array is empty" do
    expect(countUnique([])).to eq(0)
  end
end

describe "#printAll" do
  let(:result) {(0..1000).to_a}
  it "prints all numbers from 0 to 1000 without using loops or conditions" do
    expect(printAll()).to eq(result)
  end
end