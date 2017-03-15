# frozen_string_literal: true
require 'sprockets/autoload'
require 'sprockets/sass_compressor'
require 'base64'

module Sprockets
  class SasscCompressor < SassCompressor
    def initialize(options = {})
      @options = {
        syntax: :scss,
        style: :compressed,
        source_map_embed: true,
        source_map_file: '.'
      }.merge(options).freeze
    end

    def call(input)
      # SassC requires the template to be modifiable
      input_data = input[:data].frozen? ? input[:data].dup : input[:data]
      data = Autoload::SassC::Engine.new(input_data, @options.merge(filename: 'filename')).render

      match_data = data.match(/(.*)\n\/\*# sourceMappingURL=data:application\/json;base64,(.+) \*\//m)
      css, map = match_data[1], Base64.decode64(match_data[2])

      map = SourceMapUtils.combine_source_maps(
        input[:metadata][:map],
        SourceMapUtils.decode_json_source_map(map)["mappings"]
      )

      { data: css, map: map }
    end
  end
end
