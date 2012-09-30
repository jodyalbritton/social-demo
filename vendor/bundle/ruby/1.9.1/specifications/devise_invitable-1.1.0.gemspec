# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "devise_invitable"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sergio Cambra"]
  s.date = "2012-08-20"
  s.description = "It adds support for send invitations by email (it requires to be authenticated) and accept the invitation by setting a password."
  s.email = ["sergio@entrecables.com"]
  s.homepage = "https://github.com/scambra/devise_invitable"
  s.rdoc_options = ["--main", "README.rdoc", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.rubygems_version = "1.8.24"
  s.summary = "An invitation strategy for Devise"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<railties>, ["~> 3.0"])
      s.add_runtime_dependency(%q<actionmailer>, ["~> 3.0"])
      s.add_runtime_dependency(%q<devise>, [">= 2.1.0"])
    else
      s.add_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_dependency(%q<railties>, ["~> 3.0"])
      s.add_dependency(%q<actionmailer>, ["~> 3.0"])
      s.add_dependency(%q<devise>, [">= 2.1.0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.1.0"])
    s.add_dependency(%q<railties>, ["~> 3.0"])
    s.add_dependency(%q<actionmailer>, ["~> 3.0"])
    s.add_dependency(%q<devise>, [">= 2.1.0"])
  end
end
