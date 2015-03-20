module NeopolyStyle
  module Patches
    # Patches to be applied to the global ApplicationHelper to support
    # out custom styling
    module ApplicationHelperPatch
      extend ActiveSupport::Concern

      included do
        alias_method_chain :favicon_path, :neopoly_style
      end

      # Returns the path to our own favicon
      def favicon_path_with_neopoly_style
        path = "/plugin_assets/neopoly_style/images/favicon.ico"
        image_path(path)
      end
    end
  end
end
