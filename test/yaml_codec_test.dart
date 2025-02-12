import 'package:test/test.dart';
import 'package:yaml_codec/yaml_codec.dart';

void main() {
  test(
    'yamlEncode',
    () {
      expect(
        yamlEncode({
          'name': 'Joe',
          'ids': [10, 20, 30],
          'desc': 'This is\na multiline\ntext',
          'enabled': true,
        }),
        equals(
          '''
name: 'Joe'
ids:
  - 10
  - 20
  - 30
desc: |-
  This is
  a multiline
  text
enabled: true
''',
        ),
      );
    },
  );

  test(
    'yamlDecode',
    () {
      expect(
        yamlDecode('''
name: 'Joe'
ids:
  - 10
  - 20
  - 30
desc: |-
  This is
  a multiline
  text
enabled: true
'''),
        equals(
          {
            'name': 'Joe',
            'ids': [10, 20, 30],
            'desc': 'This is\na multiline\ntext',
            'enabled': true,
          },
        ),
      );
    },
  );
}
