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
        line.chomp!

        if header_match = line.match(/^(#+)\s(.+)$/)
          header_level = header_match[1].length
          content = header_match[2]
          parsed_lines.push("<h#{header_level}>#{content}</h#{header_level}>")
        elsif emphasis_match = line.match(/^(.*)(\*|_)(.+)\2(.*)$/)
          before_content = emphasis_match[1]
          content = emphasis_match[3]
          after_content = emphasis_match[4]
          parsed_lines.push("#{before_content}<em>#{content}</em>#{after_content}")
        else
          parsed_lines.push(line)
        end
      end

      parsed_lines.join
    end

    class HeaderTagParser
    end
  end
end
