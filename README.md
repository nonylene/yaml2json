# yaml2json

![](https://github.com/nonylene/yaml2json/workflows/Build/badge.svg)

## Usage

```console
$ yaml2json [-h, -v] [filename or - (stdin)]
```

## Install

You can download from [releases](https://github.com/nonylene/yaml2json/releases) tab.

```console
$ wget https://github.com/nonylene/yaml2json/releases/latest/download/yaml2json-`uname -s`-`uname -m`.zip
$ unzip yaml2json-`uname -s`-`uname -m`.zip
$ chmod +x yaml2json-`uname -s`-`uname -m`/yaml2json
$ mv yaml2json-`uname -s`-`uname -m`/yaml2json {bin dir}
```

## Development

### Build

```console
$ nimble build
```

### Release

1. Bump up `VERSION` in [meta.nim](./src/meta.nim)
2. Bump up `version` in [yaml2json.nimble](./yaml2json.nimble)
3. Tag version in git (`git tag vX.X.X`)
4. Push tag

## License and Notices

See [LICENSE](./LICENSE) and [NOTICE](./NOTICE)
