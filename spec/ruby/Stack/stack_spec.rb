describe Stack do
  subject { Stack.new }
  it "new stack object validates to true" do
    expect(subject).to be_instance_of(Stack)
  end
  describe "#push" do
    it "increments the stack size by 1" do
      expect { subject.push(5) }.to change{subject.size}.by(1)
    end
  end
  describe "#is_stack_bottom?" do
    it "returns true if stack is empty" do
      expect(subject.is_stack_bottom?).to be true
    end
    it "returns false if stack is not empty" do
      subject.push(5)
      expect(subject.is_stack_bottom?).to be false
    end
  end
  describe "#seek" do
    it "returns last pushed element to stack" do
      subject.push(5)
      expect(subject.seek).to eq(5)
    end
    it "returns nil if stack is empty" do
      expect(subject.seek).to be nil
    end
  end
  describe "#pop" do
    it "decreases the stack size by 1" do
      subject.push(5)
      # change by -1 since size coming down from 1 to 0
      expect { subject.pop }.to change{subject.size}.by(-1)
    end
    it "returns nil if stack is empty" do
      expect(subject.pop).to be nil
    end
  end
end