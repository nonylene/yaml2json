import streams
import yaml
import json
import logging
import parseopt
import parseopt
import ./meta

const USAGE_PROMPT = "Usage: yaml2json [-h,-v] [filename or - (STDIN)]"
const VERSION_PROMPT = "yaml2json " & meta.VERSION

var logger = newConsoleLogger()
addHandler(logger)

proc writeHelp() =
  echo VERSION_PROMPT
  echo USAGE_PROMPT
  quit()

proc errorHelp() =
  error(USAGE_PROMPT)
  quit(1)

proc writeVersion() =
  echo VERSION_PROMPT
  quit()

proc main(filename: string) =
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

# parseopt
var filename: string
var parser = initOptParser(shortNoVal = {'h'}, longNoVal = @["help"])

for kind, key, val in parser.getopt():
  case kind
  of cmdArgument:
    filename = key
  of cmdLongOption, cmdShortOption:
    case key
    of "help", "h": writeHelp()
    of "version", "v": writeVersion()
  of cmdEnd: assert(false) # This should not occur

if filename == "":
  # argument not passed
  errorHelp()

main(filename)
