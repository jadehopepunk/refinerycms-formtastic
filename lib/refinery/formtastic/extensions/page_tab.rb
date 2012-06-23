require 'refinery/pages/tab'

module Refinery
  module Pages
    class Tab
      def initialize(options = {})
        options.each do |key, value|
          self.send("#{key}=", value)
        end
      end
    end
  end
end
