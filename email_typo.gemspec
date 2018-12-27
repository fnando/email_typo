# frozen_string_literal: true

require "./lib/email_typo/version"

Gem::Specification.new do |spec|
  spec.name          = "email_typo"
  spec.version       = EmailTypo::VERSION
  spec.authors       = ["Nando Vieira"]
  spec.email         = ["fnando.vieira@gmail.com"]

  spec.summary       = "Clean up e-mail strings when the user's made a typo (like 'gmail.cmo')."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/fnando/email_typo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-utils"
  spec.add_development_dependency "pry-meta"
  spec.add_development_dependency "simplecov"
end
