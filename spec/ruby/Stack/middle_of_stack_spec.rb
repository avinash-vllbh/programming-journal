# spec/ruby/stack/middle_of_stack_spec.rb
describe "#middle_element" do

  context "using #build_stack to build a stack with random values" do
    let(:stack) {build_stack}
    it "returns the middle element of the stack" do
      printed = capture_stdout do
        middle_element(stack)
      end
      expect(printed).to be_truthy
    end
  end

  context "passing stack manually" do
    subject {Stack.new}
    it "returns the middle element of the stack" do
      $stdout.stub(:write)
      subject.push(5)
      subject.push(3)
      subject.push(2)
      expect(middle_element(subject)).to eq(3)
    end
  end
end