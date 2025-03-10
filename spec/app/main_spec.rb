require_relative '../../app/main'

describe "test" do
  it "should work" do
    expect(true).to eq(true)
  end
end

describe "Shell" do
  it "should should find Shell" do
    # allow($stdin).to receive(:gets).and_return("exit")
    $stdin = StringIO.new("exit")


    Shell
  end

  
end