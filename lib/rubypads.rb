require "httparty"
require "nokogiri"
require "rubypads/client"
require "rubypads/version"

module Rubypads
  @@sandbox_mode = false
  class << self
    def sandbox_mode
      @@sandbox_mode
    end

    def sandbox_mode=(sandbox)
      @@sandbox_mode = sandbox
    end
  end
end
