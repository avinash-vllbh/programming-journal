describe "#median_sorted_arrays" do
	it "returns the medain correctly for even sized arrays" do
		expect(median_sorted_arrays([3,4],[4,5])).to eq(4)
	end
  it "returns the medain correctly for odd sized arrays" do
    expect(median_sorted_arrays([3,7,9,11,12], [4,6,8,11,13])).to eq(9)
  end
end

describe "#median_sorted_arrays_dc" do
  it "returns the medain correctly for even sized arrays using divide and conquer" do
    expect(median_sorted_arrays([3,4],[4,5])).to eq(4)
  end
  it "returns the medain correctly for odd sized arrays using divide and conquer" do
    expect(median_sorted_arrays([3,7,9,11,12], [4,6,8,11,13])).to eq(9)
  end
end