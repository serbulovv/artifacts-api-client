Gem::Specification.new do |spec|
  spec.name        = "artifacts_api_client"
  spec.version     = "1.0.0"
  spec.authors     = ["Genry Wood"]
  spec.email         = ['genrywood666@gmail.com']

  spec.summary     = "Provides handy classes and errors parsing for Artifacts API"
  spec.files       = Dir["lib/**/*"]

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'zeitwerk', '~> 2.6'
  spec.add_dependency 'faraday', '~> 2.0'
end