module Markdown
  class Parser
    class HeaderTagParser < TagParser
      RXP = /^(#+)\s(.+)$/

      def parse
        header_match = line.match(RXP)
        header_level = header_match[1].length
        content = header_match[2]

        "<h#{header_level}>#{content}</h#{header_level}>"
      end
    end
  end
end
