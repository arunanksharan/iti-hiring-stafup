class NoDataException implements Exception {
  final String message;

  NoDataException(this.message);

  @override
  String toString() {
    return message;
  }
}
