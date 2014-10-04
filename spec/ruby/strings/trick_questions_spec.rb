# require 'spec_helper'
# require_relative '../../../ruby/Strings/trick_questions'
describe "#number_to_text" do
  context "when passed valid integers" do
    it "returns ten for number 10" do
      expect(number_to_text(10)).to eq("ten")
    end
    it "returns seventeen for number 17" do
      expect(number_to_text(17)).to eq("seventeen")
    end
    it "returns fifty five for number 55" do
      expect(number_to_text(55)).to eq("fifty five")
    end
    it "returns two hundred and fifty five for number 255" do
      expect(number_to_text(255)).to eq("two hundred and fifty five")
    end
    it "returns one hundred and ninety two for 192.101" do
      expect(number_to_text(192.101)).to eq("one hundred and ninety two")
    end
  end
  context "when passed invalid numbers or strings" do
    it "returns ArgumentError for strings" do
      expect(number_to_text("test")).to be_instance_of(ArgumentError)
    end
  end
end

describe "#roman_to_integer" do
  context "when given valid roman numerical strings as input" do
    it "returns 8 for VIII" do
      expect(roman_to_integer("VIII")).to eq(8)
    end
    it "returns 14 for XIV" do
      expect(roman_to_integer("XIV")).to eq(14)
    end
    it "returns 59 for LIX" do
      expect(roman_to_integer("LIX")).to eq(59)
    end
    it "returns 27 for XXVII" do
      expect(roman_to_integer("XXVII")).to eq(27)
    end
    it "returns 96 for XCVI" do
      expect(roman_to_integer("XCVI")).to eq(96)
    end
  end
  context "when given invalid roman numeral strings as input" do
    it "returns nil for empty string" do
      expect(roman_to_integer("")).to be nil
    end
    it "raises error for invalid roman numerals" do
      expect(roman_to_integer("XYVI")).to be_instance_of(NoMethodError)
    end
  end
end

describe "#longest_sub_string" do
  it "returns the correct size of the longest substring with unique chars" do
    expect(longest_sub_string("abcabcbb")).to eq(3)
  end
  it "returns the longest substring if an earilier found string less than it's length" do
    expect(longest_sub_string("hehellmnmnpqpqr")).to eq(4)
  end
  it "returns 1 if all chars are same" do
    expect(longest_sub_string("bbbb")).to eq(1)
  end
  it "can handle edge cases of string being empty" do
    expect(longest_sub_string("")).to eq(0)
  end
end

describe "#replace_matching_pattern" do
  it "returns string after replacing it with matching pattern" do
    expect(replace_matching_pattern("hellello", "ell", "x")).to eq("hxo")
  end
  it "returns string after replacing it with matching contiguous pattern" do
    expect(replace_matching_pattern("abcdeffdfegabcabc", "abc", "X")).to eq("XdeffdfegX")
  end
  it "returns the same string if no match is found" do
    expect(replace_matching_pattern("helloavi", "pqr", "x")).to eq("helloavi")
  end
end

describe "#count_unique" do
  let(:input) {%w(hi hello hw how are you hi hw heello)}
  let(:result) {7}
  it "returns the correct number of unique strings in a collection" do
    expect(count_unique(input)).to eq(result)
  end
  it "returns 1 if there is only single element in array" do
    expect(count_unique(["test"])).to eq(1)
  end
  it "returns 0 if array is empty" do
    expect(count_unique([])).to eq(0)
  end
end

describe "#print_all" do
  let(:result) {(0..1000).to_a}
  it "prints all numbers from 0 to 1000 without using loops or conditions" do
    expect(print_all()).to eq(result)
  end
end