# -*- encoding: utf-8 -*-
# stub: ancestry 3.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ancestry".freeze
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/stefankroes/ancestry/issues", "changelog_uri" => "https://github.com/stefankroes/ancestry/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/stefankroes/ancestry", "source_code_uri" => "https://github.com/stefankroes/ancestry/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stefan Kroes".freeze, "Keenan Brock".freeze]
  s.date = "2020-08-03"
  s.description = "  Ancestry allows the records of a ActiveRecord model to be organized in a tree\n  structure, using a single, intuitively formatted database column. It exposes\n  all the standard tree structure relations (ancestors, parent, root, children,\n  siblings, descendants) and all of them can be fetched in a single sql query.\n  Additional features are named_scopes, integrity checking, integrity restoration,\n  arrangement of (sub)tree into hashes and different strategies for dealing with\n  orphaned records.\n".freeze
  s.email = "keenan@thebrocks.net".freeze
  s.homepage = "https://github.com/stefankroes/ancestry".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Organize ActiveRecord model into a tree structure".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.2.0"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 4.2.0"])
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 4.2.0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
  end
end
