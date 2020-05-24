class EGApiException implements Exception {
  String code;
  String message;

  EGApiException(this.code, this.message);
}