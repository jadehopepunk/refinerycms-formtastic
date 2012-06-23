require 'refinerycms-core'
require 'formtastic'

module Refinery
  autoload :FormtasticGenerator, 'generators/refinery/formtastic_generator'

  module Formtastics
    require 'refinery/formtastic/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
