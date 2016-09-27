#!/usr/bin/env ruby
#
# yaml2json
#

require "yaml"
require "json"

puts YAML.dump JSON.load ARGF.read
