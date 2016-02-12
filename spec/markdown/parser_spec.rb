require 'spec_helper'

describe Markdown::Parser do
  describe "#parse" do
    (1..6).each do |header_level|
      it "parses header #{header_level}" do
        hashes = '#' * header_level
        content = "Heading #{header_level}"
        file = StringIO.new("#{hashes} #{content}\n")

        parser = described_class.new(file)
        parsed = parser.parse
        expect(parsed).to eq("<h#{header_level}>#{content}</h#{header_level}>")
      end
    end
  end
end
