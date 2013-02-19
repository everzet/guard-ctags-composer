module Guard
  module Ctags
    module Composer
      class CtagsGenerator
        def initialize(opts = {})
          @opts = opts
          @opts[:name_patterns] = @opts[:name_patterns] || ['\\*.php']
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

          name_patterns = ''
          if @opts[:name_patterns].instance_of?(Array)
            name_patterns = ' -name '
            name_patterns << @opts[:name_patterns].join(' -or -name ').strip
          end

          cmd = "find #{path} -type f #{name_patterns} | ctags -f #{tag_file} -L -"
          cmd << " -e" if @opts[:emacs]

          system(cmd)
          system("cat tags vendor.tags > TAGS") if @opts[:emacs]
        end
      end
    end
  end
end
