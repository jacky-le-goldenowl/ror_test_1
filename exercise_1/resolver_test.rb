# write code here...
require 'rspec'
require 'resolver.rb'

RSpec.describe "pairedElements" do
  it "get pair with the given sum in an array" do
    expect(pairedElements(10, [3, 4, 5, 6, 7])).to eq('ƒ(10, [3, 4, 5, 6, 7]) -> [[4, 6], [3, 7]]')
    expect(pairedElements(8, [3, 4, 5, 4, 4])).to eq('ƒ(8, [3, 4, 5, 4, 4]) -> [[3, 5]]')
  end

  it "return array result null if not found" do
    expect(pairedElements(10, [3, 4, 5, 4, 4])).to eq('ƒ(10, [3, 4, 5, 6, 7]) -> []')
  end
end

RSpec::Core::Runner.run([$__FILE__])
