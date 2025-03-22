class LoginModel {
  final String? token;
  final String? tokenType;

  LoginModel({this.token, this.tokenType});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(token: json['token'], tokenType: json['token_type']);
  }
}
