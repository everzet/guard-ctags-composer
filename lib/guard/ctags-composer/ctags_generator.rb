module Guard
  module Ctags
    module Composer
      class CtagsGenerator
        def initialize(opts = {})
          @opts = opts
        end

        def generate_project_tags
          generate_tags(@opts[:src_path] || "src", "tags")
        end

        def generate_vendor_tags
          generate_tags(@opts[:vendor_path] || "vendor", "vendor.tags")
        end

        private

        def generate_tags(path, tag_file)
          if path.instance_of?(Array)
            path = path.join(' ').strip
          end

          cmd = "find #{path} -type f -name \\*.php | ctags -f #{tag_file} -L -"
          cmd << " -e" if @opts[:emacs]
          system(cmd)
          system("cat tags vendor.tags > TAGS") if @opts[:emacs]
        end
      end
    end
  end
end
