function y2j
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF.read))'
end
