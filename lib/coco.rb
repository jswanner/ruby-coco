require 'execjs'
require 'coco/source'

module Coco
  EngineError      = ExecJS::RuntimeError
  CompilationError = ExecJS::ProgramError

  module Source
    def self.path
      @path ||= ENV['COCO_SOURCE_PATH'] || bundled_path
    end

    def self.path=(path)
      @contents = @version = @bare_option = @context = nil
      @path = path
    end

    def self.contents
      @contents ||= File.read(path)
    end

    def self.version
      @version ||= contents[/Coco ([\d.]+)/, 1]
    end

    def self.bare_option
      @bare_option ||= contents.match(/noWrap/) ? 'noWrap' : 'bare'
    end

    def self.context
      @context ||= ExecJS.compile(contents)
    end
  end

  class << self
    def engine
    end

    def engine=(engine)
    end

    def version
      VERSION
    end

    # Compile a script (String or IO) to JavaScript.
    def compile(script, options = {})
      script = script.read if script.respond_to?(:read)

      if options.key?(:bare)
      elsif options.key?(:no_wrap)
        options[:bare] = options[:no_wrap]
      else
        options[:bare] = false
      end

      Source.context.call("Coco.compile", script, options)
    end
  end
end
