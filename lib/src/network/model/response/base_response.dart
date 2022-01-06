class BaseNetworkResponse {
  final String? message;
  final String? errorCode;

  BaseNetworkResponse({
    required this.message,
    required this.errorCode,
  });

  factory BaseNetworkResponse.fromJson(Map<String, dynamic> json) =>
      BaseNetworkResponse(
        message: json["message"],
        errorCode: json["errorCode"],
      );

  bool get hasError =>
      message?.isNotEmpty == true || errorCode?.isNotEmpty == true;

  String generateErrorReadableString() {
    if (!hasError) {
      throw Exception('This response does not contain any error!');
    }

    StringBuffer buffer = StringBuffer(message ?? '');

    if (errorCode != null) {
      buffer.write(' (');
      buffer.write(errorCode);
      buffer.write(')');
    }

    return buffer.toString();
  }
}
