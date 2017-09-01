# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'ackr'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'The smallest subset of ack/rak/ag. For lazy developers'
  s.homepage = 'https://github.com/lkdjiin/ackr'
  s.description = %q{Ackr is the smallest subset of ack/rak/ag I can think of. For lazy developers}

	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*'].to_a + readmes
	s.license = 'MIT'
	s.required_ruby_version = '>= 2.2.0'
	s.executables = ['ackr']
  s.add_dependency 'rainbow', '1.99.2'
end
