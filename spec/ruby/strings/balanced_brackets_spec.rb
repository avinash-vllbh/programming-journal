#spec/ruby/strings/balanced_brackets_spec.rb

describe "#checkBracketsBalanced" do
  it 'returns true if a string has balanced braces' do
    expect(checkBracketsBalanced("({[]})")).to be true
  end
  it 'returns false if a string has unbalanced braces' do
    expect(checkBracketsBalanced("([{]})")).to be false
  end
end

describe "#checkBracketsRecursive" do
  it 'returns true if a string has balanced braces' do
    expect(checkBracketsRecursive("({[]})")).to be true
  end
  it 'returns false if a string has unbalanced braces' do
    expect(checkBracketsRecursive("([{]})")).to be false
  end
end