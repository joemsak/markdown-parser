module Markdown
  class Parser
    class TagParser
      private
      attr_reader :line

      public
      def self.parsers
        @parsers ||= []
      end

      def self.inherited(base)
        parsers.push(base)
      end

      def self.recognizes?(line)
        !!line.match(const_get(:RXP))
      end

      def initialize(line)
        @line = line.chomp
      end

      def parse
        self.class.parsers.each do |parser_class|
          if parser_class.recognizes?(line)
            parser = parser_class.new(line)
            return parser.parse
          end
        end

        line
      end
    end
  end
end
