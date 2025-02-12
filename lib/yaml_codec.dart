library;

import 'dart:convert' show Codec, Converter;

import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

/// An instance of the default implementation of the [YamlCodec].
///
/// This instance provides a convenient access to the most common YAML
/// use cases.
///
/// Examples:
/// ```dart
/// var encoded = yaml.encode([1, 2, { "a": null }]);
/// var decoded = yaml.decode('foo: "bar"');
/// ```
///
/// The top-level [yamlEncode] and [yamlDecode] functions may be used instead if
/// a local variable shadows the [yaml] constant.
const YamlCodec yaml = YamlCodec();

/// Converts [object] to a YAML string.
///
/// Shorthand for `yaml.encode`.
/// Useful if a local variable shadows the global [yaml] constant.
String yamlEncode(Object? object) => yaml.encode(object);

/// Parses the string and returns the resulting YAML object.
///
/// Shorthand for `yaml.decode`.
/// Useful if a local variable shadows the global [yaml] constant.
dynamic yamlDecode(String source) => yaml.decode(source);

/// A [YamlCodec] encodes YAML objects to strings and decodes strings to
/// YAML objects.
///
/// Examples:
/// ```dart
/// var encoded = yaml.encode([1, 2, { "a": null }]);
/// var decoded = yaml.decode('foo: "bar"');
/// ```
final class YamlCodec extends Codec<Object?, String> {
  /// The indentation size.
  ///
  /// Must be greater or equal to `1`.
  ///
  /// Defaults to `2`.
  final int indentSize;

  /// If `true` it will allow unquoted strings.
  final bool allowUnquotedStrings;

  /// Used to convert objects to an encodable version.
  final Object? Function(dynamic object) toEncodable;

  const YamlCodec({
    this.indentSize = 2,
    this.allowUnquotedStrings = false,
    this.toEncodable = _defaultToEncodable,
  });

  @override
  Converter<Object?, String> get encoder => YamlEncoder(
        indentSize: indentSize,
        allowUnquotedStrings: allowUnquotedStrings,
        toEncodable: toEncodable,
      );

  @override
  Converter<String, Object?> get decoder => YamlDecoder();
}

/// `toJson()` is used as a community-conventional way of naming methods
/// that return `Map<String, dynamic>`.
///
/// `toMap()` is used as a fallback.
dynamic _defaultToEncodable(dynamic object) {
  try {
    return object.toJson();
  } on NoSuchMethodError {
    try {
      return object.toMap();
    } on NoSuchMethodError {
      rethrow;
    }
  }
}

/// This class converts YAML objects to strings.
typedef YamlEncoder = YamlWriter;

/// This class parses YAML strings and builds the corresponding objects.
final class YamlDecoder extends Converter<String, Object?> {
  const YamlDecoder();

  @override
  Object? convert(String input) => loadYaml(input);
}
