function j2y
  ruby -ryaml -rjson -e 'puts YAML.dump(JSON.load(ARGF.read))'
end
