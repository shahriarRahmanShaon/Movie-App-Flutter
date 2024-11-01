class FavoriteResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  FavoriteResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteResponse(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
}
