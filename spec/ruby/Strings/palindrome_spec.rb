describe "#isPalindrome" do
  it "returns true if a string is palindrome" do
    expect(isPalindrome("lol")).to be true
  end
end

describe "#longestPalindromeDP" do
  it "returns longest palindrome substring in a string" do
    expect(longestPalindromeDP("cayak")).to eq("aya")
  end
  it "returns first char, if a string doesn't have a substring palindrome" do
    expect(longestPalindromeDP("night")).to eq("n")
  end
end