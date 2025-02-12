import 'dart:convert' show JsonEncoder, json;

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

  final jsonEncoder = JsonEncoder.withIndent('  ');
  var jsonText = yaml.decoder.fuse(jsonEncoder).convert(yamlText);
  print(jsonText);

  var yamlTextAgain = json.decoder.fuse(yaml.encoder).convert(jsonText);
  print(yamlTextAgain);
}
