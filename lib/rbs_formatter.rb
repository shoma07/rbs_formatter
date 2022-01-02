# frozen_string_literal: true

require "stringio"
require "pathname"
require "rbs"
require_relative "rbs_formatter/version"

# RBSFormatter
module RBSFormatter
  class << self
    # @return [void]
    def execute
      Dir["#{Dir.pwd}/sig/**/*.rbs"].each { |dir| format(dir) }
    end

    private

    # @param file [String]
    # @return [void]
    def format(file)
      StringIO.new.then do |io|
        RBS::EnvironmentLoader.new(core_root: nil)
                              .tap { |param| param.add(path: Pathname(file)) }
                              .then { |param| RBS::Environment.from_loader(param) }
                              .then(&:resolve_type_names)
                              .then(&:declarations)
                              .then { |param| RBS::Writer.new(out: io).write(param) }
        File.write(file, io.tap(&:rewind).read)
      end
    end
  end
end
