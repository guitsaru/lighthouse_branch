# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lighthouse_branch}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Pruitt"]
  s.date = %q{2009-06-23}
  s.email = %q{guitsaru@gmail.com}
  s.executables = ["lh-branch", "lhb"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/lh-branch",
     "bin/lhb",
     "lib/lighthouse_branch.rb",
     "lib/lighthouse_branch/command/base.rb",
     "lib/lighthouse_branch/commands/branch.rb",
     "lib/lighthouse_branch/commands/checkout.rb",
     "lib/lighthouse_branch/commands/commit.rb",
     "lib/lighthouse_branch/commands/delete.rb",
     "lib/lighthouse_branch/commands/merge.rb",
     "lib/lighthouse_branch/commands/pull.rb",
     "lib/lighthouse_branch/commands/push.rb",
     "lib/lighthouse_branch/commands/resolve.rb",
     "lib/lighthouse_branch/commands/update.rb",
     "lighthouse_branch.gemspec",
     "test/command/test_base.rb",
     "test/commands/test_branch.rb",
     "test/commands/test_checkout.rb",
     "test/commands/test_commit.rb",
     "test/commands/test_delete.rb",
     "test/commands/test_merge.rb",
     "test/commands/test_pull.rb",
     "test/commands/test_push.rb",
     "test/commands/test_resolve.rb",
     "test/commands/test_update.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/guitsaru/lighthouse_branch}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{lh-branch}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Easily manage branches based off lighthouse tickets.}
  s.test_files = [
    "test/command/test_base.rb",
     "test/commands/test_branch.rb",
     "test/commands/test_checkout.rb",
     "test/commands/test_commit.rb",
     "test/commands/test_delete.rb",
     "test/commands/test_merge.rb",
     "test/commands/test_pull.rb",
     "test/commands/test_push.rb",
     "test/commands/test_resolve.rb",
     "test/commands/test_update.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<grit>, [">= 1.1.1"])
      s.add_runtime_dependency(%q<Caged-lighthouse-api>, [">= 1.0.0"])
    else
      s.add_dependency(%q<grit>, [">= 1.1.1"])
      s.add_dependency(%q<Caged-lighthouse-api>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<grit>, [">= 1.1.1"])
    s.add_dependency(%q<Caged-lighthouse-api>, [">= 1.0.0"])
  end
end
