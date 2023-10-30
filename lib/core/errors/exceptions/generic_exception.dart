final class GenericException implements Exception {
  const GenericException({
    required this.message,
    required this.error,
  });
  final String message;
  final Object error;
}
