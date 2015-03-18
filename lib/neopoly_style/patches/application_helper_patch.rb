module NeopolyStyle
  module Patches
    module ApplicationHelperPatch
      extend ActiveSupport::Concern

      included do
        alias_method_chain :favicon_path, :neopoly_style
      end

      def favicon_path_with_neopoly_style
        path = "/plugin_assets/neopoly_style/images/favicon.ico"
        image_path(path)
      end
    end
  end
end
