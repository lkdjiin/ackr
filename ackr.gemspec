# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'ackr'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'Ackr is a very small subset of grep/ack/rak, for lazy developers'
  s.homepage = 'https://github.com/lkdjiin/ackr'
  s.description = %q{Ackr is a very small subset of grep/ack/rak, for lazy developers}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*'].to_a + readmes
	s.license = 'MIT'
	s.required_ruby_version = '>= 1.9.2'
	s.executables = ['ackr']
  s.add_dependency 'rainbow', '>= 1.1.4'
end
