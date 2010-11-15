# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{conman}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richard Taylor"]
  s.date = %q{2010-11-14}
  s.description = %q{conman is a server configuration management library}
  s.email = %q{moomerman@gmail.com}
  s.files = ["LICENSE", "README.md","lib/conman.rb"] + Dir.glob('lib/conman/*.rb')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/moomerman/conman}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{conman}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{conman is a server configuration management library}
  s.executables << 'conman'
end