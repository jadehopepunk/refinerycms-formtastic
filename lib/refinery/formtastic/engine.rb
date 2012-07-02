module Refinery
  module Formtastic
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Formtastic
      engine_name :refinery_formtastic

      before_inclusion do
        Refinery::AdminController.send :helper, Refinery::Pages::ContentPagesHelper
        Refinery::AdminController.send(:helper, Refinery::Formtastic::PageTabsHelper)
      end

      config.after_initialize do
        Refinery::Core.config.register_stylesheet("refinery/formtastic/admin_base")
        Refinery::Core.config.register_stylesheet("refinery/formtastic/admin")
        require 'refinery/formtastic/extensions/page_tab'
        require 'refinery/formtastic/page_tabs_helper'
      end
    end
  end
end
