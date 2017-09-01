Gem::Specification.new do |s|
  s.name = 'ackr'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'The smallest subset of ack/rak/ag. For lazy developers'
  s.homepage = 'https://github.com/lkdjiin/ackr'
  s.description = %q{Ackr is the smallest subset of ack/rak/ag I can think of. For lazy developers}

  s.files = `git ls-files -z`.split("\x0")
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
	s.license = 'MIT'
	s.required_ruby_version = '>= 2.2.0'
	s.executables = ['ackr']
  s.add_dependency 'rainbow', '~> 2.2'
end
