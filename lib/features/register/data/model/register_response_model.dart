class RegisterResponseModel {
  String? message;
  int? status;
  String? errorMessage;

  RegisterResponseModel({
    required this.message,
    required this.status,
    required this.errorMessage,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      errorMessage: json['ErrorMessage'] ?? '',
    );
  }
}