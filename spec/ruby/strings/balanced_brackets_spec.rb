#spec/ruby/strings/balanced_brackets_spec.rb

describe "#check_brackets_balanced" do
  it 'returns true if a string has balanced braces' do
    expect(check_brackets_balanced("({[]})")).to be true
  end
  it 'returns false if a string has unbalanced braces' do
    expect(check_brackets_balanced("([{]})")).to be false
  end
end

describe "#check_brackets_recursive" do
  it 'returns true if a string has balanced braces' do
    expect(check_brackets_recursive("({[]})")).to be true
  end
  it 'returns false if a string has unbalanced braces' do
    expect(check_brackets_recursive("([{]})")).to be false
  end
end