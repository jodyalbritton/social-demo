# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "acts_as_follower"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Cocca"]
  s.date = "2011-11-06"
  s.description = "acts_as_follower is a Rubygem to allow any model to follow any other model. This is accomplished through a double polymorphic relationship on the Follow model. There is also built in support for blocking/un-blocking follow records. Main uses would be for Users to follow other Users or for Users to follow Books, etc\u{e2}\u{80}\u{a6} (Basically, to develop the type of follow system that GitHub has)"
  s.email = ["tom dot cocca at gmail dot com"]
  s.homepage = "https://github.com/tcocca/acts_as_follower"
  s.require_paths = ["lib"]
  s.rubyforge_project = "acts_as_follower"
  s.rubygems_version = "1.8.24"
  s.summary = "A Rubygem to add Follow functionality for ActiveRecord models"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<factory_girl>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["~> 3.0.10"])
    else
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<factory_girl>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.0.10"])
    end
  else
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<factory_girl>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.0.10"])
  end
end
