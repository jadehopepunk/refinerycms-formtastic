# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Craig Ambrose"]
  s.email             = %q{craig@craigambrose.com}
  s.name              = 'refinerycms-formtastic'
  s.version           = '1.0.2'
  s.description       = 'A rails engine which allows the use of Formtastic in the RefineryCMS backend.'
  s.date              = '2012-06-23'
  s.summary           = 'Use formtastic with Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.homepage          = %q{http://github.com/craigambrose/refinerycms-formtastic}

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.5'
  s.add_dependency             'formtastic',          '~> 2.2.1'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.5'
end
