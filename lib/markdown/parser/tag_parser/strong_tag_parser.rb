module Markdown
  class Parser
    class StrongTagParser < TagParser
      RXP = /^(.*)(\*\*|__)([^\2]+)\2(.*)$/

      def parse
        emphasis_match = line.match(RXP)
        before_content = emphasis_match[1]
        content = emphasis_match[3]
        after_content = emphasis_match[4]

        "#{before_content}<strong>#{content}</strong>#{after_content}"
      end
    end
  end
end
