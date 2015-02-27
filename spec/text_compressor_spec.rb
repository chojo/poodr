require_relative '../lib/text_compressor'

describe TextCompressor do
  before :each do
    text = "This specification is the specification for a specification"
    @text_compressor = TextCompressor.new(text)
  end

  describe "#new" do
    it "takes a text and returns a TextCompressor object" do
      expect(@text_compressor).to be_an_instance_of TextCompressor
    end
  end
  
end
