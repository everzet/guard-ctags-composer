require 'guard/ctagscomposer/ctags_generator'
require 'guard'
require 'guard/guard'

module Guard
  class CtagsComposer < Guard
    def initialize(watchers = [], options = {})
      super(watchers, options)
      @ctags_generator = ::Guard::Ctags::Composer::CtagsGenerator.new(options)
    end

    def start
      UI.info 'Guard::CtagsComposer is running!'
      @ctags_generator.generate_project_tags
      @ctags_generator.generate_vendor_tags
    end

    def run_on_changes(paths)
      if paths.include?('composer.lock')
        UI.info "regenerating vendor tags..."
        @ctags_generator.generate_vendor_tags
      end

      ruby_files = paths.reject {|f| f == 'composer.lock'}

      if ruby_files.any?
        UI.info "regenerating project tags..."
        @ctags_generator.generate_project_tags
      end
    end
  end
end
