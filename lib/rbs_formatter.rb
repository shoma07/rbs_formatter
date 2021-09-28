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
      Dir["#{Dir.pwd}/sig/**/*.rbs"].each { |file| format(file) }
    end

    private

    # @param file [String]
    # @return [void]
    def format(file)
      io = StringIO.new
      RBS::EnvironmentLoader.new(core_root: nil)
                            .tap { |loader| loader.add(path: Pathname(file)) }
                            .then { |loader| RBS::Environment.from_loader(loader) }
                            .then(&:resolve_type_names)
                            .then(&:declarations)
                            .then { |decls| RBS::Writer.new(out: io).write(decls) }
      File.write(file, io.tap(&:rewind).read)
    end
  end
end
