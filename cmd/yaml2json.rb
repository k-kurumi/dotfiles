#!/usr/bin/env ruby
#
# yaml2json
#

require "yaml"
require "json"

puts JSON.pretty_generate YAML.load ARGF.read
