# spec/strings/string_reversal_spec.rb

describe "#reverse" do
  it "returns tset for test" do
    expect(reverse("test")).to eq("tset")
  end
  it "returns nil for empty string as input" do
    expect(reverse("")).to eq(nil)
  end
end

describe "#reverse_words" do
  it "returns the reverse of words in a sentence" do
    expect(reverse_words("hi avi how are you")).to eq("you are how avi hi")
  end
  it "strips the space if it's at the beginning of sentence" do
    expect(reverse_words(" hi avi how are you")).to eq("you are how avi hi")
  end
  it "adds the space at the beginning of reversed, if a space is trailing in the sentence" do
    expect(reverse_words("hi avi how are you ")).to eq(" you are how avi hi")
  end
end

describe "#string_permutations" do
  let(:perms) {["dog", "dgo", "odg", "ogd", "gdo", "god"]}
  it "returns all possible permutations of a string" do
    expect(string_permutations("dog")).to eq(perms)
  end
  it "returns an array of input if passed a single char" do
    expect(string_permutations("d")).to eq(["d"])
  end
end

describe "#str_perm_efficient" do
  let(:perms) {["dog", "dgo", "odg", "ogd", "god", "gdo"]}
  it "returns all possible permutations of a string" do
    printed = capture_stdout do
      str_perm_efficient("dog", 0, 2)
    end
    expect(printed).to eq(perms.join("\n")+"\n")
  end
end