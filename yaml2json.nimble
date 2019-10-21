# Package

version       = "0.2.0" ## variable cannot be used since nimble caches .nimble file.
author        = "nonylene"
description   = "yaml2json"
license       = "MIT"
srcDir        = "src"
bin           = @["yaml2json"]

# Dependencies

requires "nim >= 1.0.0"
requires "yaml"
