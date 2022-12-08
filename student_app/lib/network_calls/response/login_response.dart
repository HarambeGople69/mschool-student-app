class LoginResponse {
  String? error;
  int? status;
  String? token;
  int? success;
  String? userName;
  int? userId;

  LoginResponse(
      {this.error,
      this.status,
      this.token,
      this.success,
      this.userName,
      this.userId});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    status = json['status'];
    token = json['token'];
    success = json['success'];
    userName = json['user_name'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['status'] = this.status;
    data['token'] = this.token;
    data['success'] = this.success;
    data['user_name'] = this.userName;
    data['user_id'] = this.userId;
    return data;
  }
}