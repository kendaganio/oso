require "thor"

require_relative "../oso"

module Oso
  class CLI < Thor
    desc "roar", "Make it speak, quick!"
    def roar
      Bear.new.roar!
    end
  end
end
