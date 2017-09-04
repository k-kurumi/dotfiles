#!/bin/bash -l

# npmが古いとエラーになることあり
npm update -g

npm install -g coffee-script
npm install -g coffeelint
npm install -g jsonlint
npm install -g eslint

npm install -g flow-bin
npm install -g flow-typed
