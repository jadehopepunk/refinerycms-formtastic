module Refinery
  module Formtastic
    module PageTabsHelper
      def tabbed_fieldsets(form, tabs, i18n_scope = nil)
        content_tag(:div, :class => 'field') do
          content_tag(:div, :id => 'page-tabs', :class => 'clearfix ui-tabs ui-widget ui-widget-content ui-corner-all') do
            tabbed_fieldset_headers(tabs, i18n_scope) +
            tabbed_fieldset_bodies(form, tabs)
          end
        end
      end

      def tabbed_fieldset_headers(tabs, i18n_scope = nil)
        content_tag(:ul, :id => 'page_parts') do
          contents = []
          tabs.each_with_index do |tab, tab_index|
            classes = ['ui-state-default']
            classes << 'ui-state-active' if tab_index == 0
            contents << content_tag(:li, :class => classes.join(' ')) do
              link_to tab_name(tab, i18n_scope), "##{tab_id(tab)}"
            end
          end
          contents.join("\n").html_safe
        end
      end

      def tabbed_fieldset_bodies(form, tabs)
        content_tag(:div, :id => 'page_part_editors') do
          tabs.map do |tab|
            tabbed_fieldset_body(form, tab)
          end.join("\n").html_safe
        end
      end

      def tabbed_fieldset_body(form, tab)
        if tab.is_a?(Symbol)
          editor_only_fieldset_body(form, tab)
        else
          partial_fieldset_body(form, tab)
        end
      end

      private

        def tab_id(tab)
          name = tab.is_a?(Symbol) ? tab : tab.name
        end

        def tab_name(tab, i18n_scope = nil)
          name = tab_id(tab)
          t(name.to_s, :scope => i18n_scope, :default => name.to_s.titleize)
        end

        def editor_only_fieldset_body(form, tab)
          content_tag(:div, :class => 'page_part', :id => tab.to_s) do
            form.text_area tab, :rows => 20, :class => 'wymeditor widest'
            # form.inputs do
            #  form.input tab, :as => :wymeditor
            # end
          end
        end

        def partial_fieldset_body(form, tab)
          content_tag(:div, :class => 'page_part', :id => tab_id(tab)) do
            render tab.partial, :f => form
          end
        end
    end
  end
end

Refinery::AdminController.send(:helper, 'refinery/formtastic/page_tabs')
