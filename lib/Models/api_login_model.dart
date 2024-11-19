class ApiLoginModel {
  final bool status;
  final String message;
  final String token;

  ApiLoginModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory ApiLoginModel.fromJson(Map<String, dynamic> json) {
    return ApiLoginModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
