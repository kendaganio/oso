require_relative "oso/version"
require 'net/http'
require 'uri'

module Oso
  class Bear

    attr_accessor :oso, :quote
  
    def initialize
      @oso = <<STRING
                      
            ("-^-/")  
            `o__o' ]  
            (_Y_) _/  
          _..`--'-.`, 
         (__)_,--(__) 
             7:   ; 1 
           _/,`-.-' : 
          (_,)-~~(_,) 
STRING
    end

    def roar!
      fetch_quote
      build_the_bear!
    end

    def fetch_quote
      uri = URI.parse('http://iheartquotes.com/api/v1/random')
      response = Net::HTTP.get_response(uri)
      @quote = response.body
    end

    def build_the_bear!
      lines = quote.split(/[\r\n]+/)
      lines = lines[0...-1]
      longest = lines.map(&:length).max
      oso_in_lines = oso.split(/[\r\n]+/)

      last_index = 0
      oso_in_lines[0] <<  "  " + "_" * (longest + 4)

      lines.each_with_index do |line, i|
        pad = ((longest - line.strip.length) / 2).to_i
        oso_in_lines[i+1] << "  |"
        oso_in_lines[i+1] <<  " " * (pad + 1)
        oso_in_lines[i+1] <<  line.strip
        oso_in_lines[i+1] <<  " " * (pad + 1)
        oso_in_lines[i+1] << "|"
        last_index = i
      end
      oso_in_lines[last_index + 2] <<  "  " + "_" * (longest + 4)

      puts oso_in_lines
    end

  end
end
