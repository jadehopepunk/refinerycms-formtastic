# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-formtastic'
  s.version           = '1.0'
  s.description       = 'Use formtastic with Refinery CMS'
  s.date              = '2012-06-23'
  s.summary           = 'Use formtastic with Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.5'
  s.add_dependency             'formtastic',          '~> 2.2.1'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.5'
end
