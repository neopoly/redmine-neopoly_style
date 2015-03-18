require "neopoly_style/patches/application_helper_patch"

module NeopolyStyle
  # This module holds all patches of a default Redmine application
  module Patches
    # Apply all patches
    def self.apply!
      apply_to(::ApplicationHelper, ApplicationHelperPatch)
    end

    private

    def self.apply_to(target, mod)
      target.send(:include, mod)
    end
  end
end
