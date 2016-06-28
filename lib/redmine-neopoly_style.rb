require "neopoly_style/version"
require "neopoly_style/infos"
require "neopoly_style/engine"

# Redmine plugin for custom style overrides
module NeopolyStyle
  FAVICON_BASE = "/plugin_assets/neopoly_style/images/favicons"

  def favicon(name = "favicon.ico")
    "#{FAVICON_BASE}/#{name}"
  end
  module_function :favicon
end
