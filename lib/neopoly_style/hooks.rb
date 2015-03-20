module NeopolyStyle
  # Includes our stylesheet and javascript files into the base layout
  class Hooks < Redmine::Hook::ViewListener
    # Inject javascript and stylesheet tags
    # @param _context [Hash] ignored
    def view_layouts_base_html_head(_context)
      javascript_tags + stylesheet_tags
    end

    private

    def javascript_tags
      javascript_include_tag "neopoly_style", plugin: "neopoly_style"
    end

    def stylesheet_tags
      stylesheet_link_tag "neopoly_style", plugin: "neopoly_style"
    end
  end
end
