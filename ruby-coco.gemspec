# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = 'ruby-coco'
  s.version     = '0.1.0'
  s.date        = '2012-02-29'
  s.authors     = ['Jacob Swanner']
  s.email       = ['jacob@jacobswanner.com']
  s.homepage    = 'https://github.com/jswanner/ruby-coco'
  s.summary     = 'Coco Compiler as ruby gem.'
  s.description = 'Ruby Coco is a bridge to the JS Coco compiler.'
  s.files       = [
    'lib/coco.rb',
    'lib/coco/version.rb',
    'lib/ruby-coco.rb'
  ]

  s.add_dependency 'ruby-coco-source'
  s.add_dependency 'execjs'
end
