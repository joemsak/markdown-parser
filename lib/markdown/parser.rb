require "markdown/parser/version"

require "markdown/parser/tag_parser"
require "markdown/parser/tag_parsers"

module Markdown
  class Parser
    private
    attr_reader :file

    public
    def initialize(file)
      @file = file
    end

    def parse
      parsed_lines = []

      file.each_line do |line|
        tag_parser = TagParser.new(line)
        parsed_lines.push(tag_parser.parse)
      end

      parsed_lines.join
    end
  end
end
