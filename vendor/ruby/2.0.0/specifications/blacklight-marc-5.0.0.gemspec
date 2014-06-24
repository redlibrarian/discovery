# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "blacklight-marc"
  s.version = "5.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Coyne"]
  s.date = "2014-02-05"
  s.description = "MARC support for Blacklight"
  s.email = ["justin@curationexperts.com"]
  s.homepage = "https://github.com/projectblacklight/blacklight_marc"
  s.licenses = ["Apache 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "MARC support for Blacklight"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<blacklight>, ["~> 5.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<jettywrapper>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_runtime_dependency(%q<marc>, ["< 1.1", ">= 0.4.3"])
    else
      s.add_dependency(%q<blacklight>, ["~> 5.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<jettywrapper>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<marc>, ["< 1.1", ">= 0.4.3"])
    end
  else
    s.add_dependency(%q<blacklight>, ["~> 5.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<jettywrapper>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<marc>, ["< 1.1", ">= 0.4.3"])
  end
end