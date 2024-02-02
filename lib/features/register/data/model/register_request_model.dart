class RegisterRequestModel {
  late final String email;
  late final String password;
  late final String phone;
  late final String name;

  RegisterRequestModel(dynamic obj) {
    email = obj['email'];
    password = obj['password'];
    phone = obj['phone'];
    name = obj['name'];
  }
}