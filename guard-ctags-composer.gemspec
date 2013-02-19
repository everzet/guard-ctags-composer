Gem::Specification.new do |s|
  s.name        = "guard-ctags-composer"
  s.version     = "0.0.2"
  s.authors     = ["Konstantin Kudryashov"]
  s.email       = ["ever.zet@gmail.com"]
  s.homepage    = "https://github.com/everzet/guard-ctags-composer"
  s.summary     = %q{Guard gem for generating ctags for project files and vendor libraries.}
  s.description = %q{Guard::CtagsComposer uses ctags utility and generates 2 files: tags -- with tags generated from project's source tree and vendor.tags -- with tags generated from vendor folder.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency 'guard', '>= 1.0.0'

  s.add_development_dependency "minitest"
  s.add_development_dependency "purdytest"
end
