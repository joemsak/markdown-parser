require 'spec_helper'

describe Markdown::Parser do
  def parse_as_file(str)
    file = StringIO.new("#{str}\n")
    parser = described_class.new(file)
    parser.parse
  end

  describe "#parse" do
    (1..6).each do |header_level|
      it "parses header #{header_level}" do
        hashes = '#' * header_level
        content = "Heading #{header_level}"

        parsed = parse_as_file("#{hashes} #{content}")
        expect(parsed).to eq("<h#{header_level}>#{content}</h#{header_level}>")
      end
    end

    it "parses emphasis with asterisks or underscores" do
      asterisks_content = "Hello *world*"
      underscores_content = "Hello _world_"

      parsed = parse_as_file(asterisks_content)
      result = "Hello <em>world</em>"

      expect(parsed).to eq(result)

      parsed = parse_as_file(underscores_content)
      expect(parsed).to eq(result)
    end

    it "doesn't match mixed asterisk/underscore cases" do
      parsed = parse_as_file("hello *world_")
      expect(parsed).to eq("hello *world_")
    end
  end
end
