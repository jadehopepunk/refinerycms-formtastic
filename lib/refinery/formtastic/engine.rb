module Refinery
  module Formtastic
    class Engine < Rails::Engine
      isolate_namespace Refinery::Formtastic

      config.after_initialize do
        Refinery::Core.config.register_stylesheet("formtastic")
        Refinery::Core.config.register_stylesheet("refinery/formtastic/admin")
        require 'refinery/formtastic/extensions/page_tab'
        require 'refinery/formtastic/page_tabs_helper'
      end
    end
  end
end
