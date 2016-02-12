module Markdown
  class Parser
    class EmphasisTagParser < TagParser
      RXP = /^(.*)(\*|_)(.+)\2(.*)$/

      def parse
        emphasis_match = line.match(RXP)
        before_content = emphasis_match[1]
        content = emphasis_match[3]
        after_content = emphasis_match[4]

        "#{before_content}<em>#{content}</em>#{after_content}"
      end
    end
  end
end
