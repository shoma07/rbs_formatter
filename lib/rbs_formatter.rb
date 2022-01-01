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
      Dir["#{Dir.pwd}/sig/**/*.rbs"].each { |_1| format(_1) }
    end

    private

    # @param file [String]
    # @return [void]
    def format(file)
      StringIO.new.then do |io|
        RBS::EnvironmentLoader.new(core_root: nil)
                              .tap { |_1| _1.add(path: Pathname(file)) }
                              .then { |_1| RBS::Environment.from_loader(_1) }
                              .then(&:resolve_type_names)
                              .then(&:declarations)
                              .then { |_1| RBS::Writer.new(out: io).write(_1) }
        File.write(file, io.tap(&:rewind).read)
      end
    end
  end
end
