require "markdown/parser/version"

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
        if header_match = line.chomp.match(/^(#+)\s(.+)$/)
          header_level = header_match[1].length
          content = header_match[2]
          parsed_lines.push("<h#{header_level}>#{content}</h#{header_level}>")
        end
      end

      parsed_lines.join
    end

    class HeaderParser
    end
  end
end
