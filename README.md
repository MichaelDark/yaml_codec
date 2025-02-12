# YAML Codec

[![pub package](https://img.shields.io/pub/v/yaml_codec.svg)](https://pub.dev/packages/yaml_codec)

Encoder and decoder for converting YAML object representation.  
Inspired by `dart:convert`'s `json`/`jsonEncode`/`jsonDecode`.
Backed by [yaml](https://pub.dev/packages/yaml) and [yaml_writer](https://pub.dev/packages/yaml_writer).

## Features

- `yaml` / `yamlDecode` / `yamlEncode`
- `YamlCodec` / `YamlEncoder` / `YamlDecoder`

## Usage

```dart
import 'package:yaml_codec/yaml_codec.dart';

void main() {
  var map = {
    'name': 'Joe',
    'ids': [10, 20, 30],
    'desc': 'This is\na multiline\ntext',
    'enabled': true,
  };

  var yamlText = yamlEncode(map);
  print(yamlText);

  var yamlMap = yamlDecode(yamlText);
  print(yamlMap);
}
```

## Support

<a href="https://www.buymeacoffee.com/michaeldark" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>