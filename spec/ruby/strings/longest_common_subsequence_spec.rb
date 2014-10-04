#spec/ruby/String/longest_common_subsequence_spec.rb

describe "#lcs" do
  it "returns the longest common subsequence and it's length as array" do
    expect(lcs("ACCGGGTTAC", "AGGACCA")).to eq(["AGGAC", 5])
  end
  it "returns empty if there is no common subsequence" do
    expect(lcs("pqrsty", "hello")).to eq(["", 0])
  end
end