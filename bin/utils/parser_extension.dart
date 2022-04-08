extension ParserExtension on String {
  toType(T) {
    switch (T) {
      case int:
        return int.tryParse(toString()) ?? 0;
      case bool:
        return ["true", "1"].contains(toLowerCase());
      case double:
        return double.tryParse(toString());
      default:
        return toString();
    }
  }
}
