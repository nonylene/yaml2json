import streams
import yaml
import json
import logging
import os

var logger = newConsoleLogger()
addHandler(logger)

proc main() =
  if paramCount() != 1:
    error("usage: yaml2json [filename or -]")
    quit(1)

  let filename = paramStr(1)

  var file: File
  defer: file.close()
  if filename == "-":
    stderr.writeLine("Reading from stdin...")
    file = stdin
  else:
    file = open(filename)

  let l = yaml.loadToJson(file.newFileStream())
  for node in l:
    echo pretty(node)

main()
