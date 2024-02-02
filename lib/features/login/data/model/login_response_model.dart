class LoginResponseModel {
  String? token;
  String? message;
  int? status;
  String? errorMessage;

  LoginResponseModel({
    required this.message,
    required this.token,
    required this.status,
    required this.errorMessage,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      errorMessage: json['ErrorMessage'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
