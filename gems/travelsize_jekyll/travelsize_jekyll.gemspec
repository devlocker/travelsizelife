# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name           = "travelsize_jekyll"
  s.version        = "0.0.1"
  s.summary        = "Collection of functions for Travelsize"
  s.description    = "Tags, functions and plugin collection to render travelsizelife.com"
  s.authors        = ["Patrick Koperwas"]
  s.email          = "patrick@devlock.io"
  s.files          = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage       = "https://github.com/devlocker/travelsize"
  s.license        = "MIT"
  s.require_paths  = ["lib"]
end
