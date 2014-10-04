describe "#isPalindrome" do
  it "returns true if a string is palindrome" do
    expect(isPalindrome("lol")).to be true
  end
end

describe "#longest_palindrome_dp" do
  it "returns longest palindrome substring in a string" do
    expect(longest_palindrome_dp("cayak")).to eq("aya")
  end
  it "returns first char, if a string doesn't have a substring palindrome" do
    expect(longest_palindrome_dp("night")).to eq("n")
  end
end