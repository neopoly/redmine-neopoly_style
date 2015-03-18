require "neopoly_style/patches"

module NeopolyStyle
  # Registers this gems a Redmine plugin and applies the needed patches
  class RedminePlugin
    include NeopolyStyle::Infos

    def initialize
      register!
      boot!
      mirror_assets!
    end

    private

    def register!
      @plugin = Redmine::Plugin.register :neopoly_style do
        name NAME
        author AUTHORS.keys.join(", ")
        description DESCRIPTION
        version VERSION
        url URL
        author_url URL
        directory Engine.root
      end
    end

    def boot!
      require "neopoly_style/hooks"
      Patches.apply!
    end

    def mirror_assets!
      @plugin.mirror_assets
    end
  end
end
