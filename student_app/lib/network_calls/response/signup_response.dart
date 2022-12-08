class SignupResponse {
  String? error;
  int? status;
  String? token;
  int? success;
  String? userName;
  int? sId;

  SignupResponse(
      {this.error,
      this.status,
      this.token,
      this.success,
      this.userName,
      this.sId});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    status = json['status'];
    token = json['token'];
    success = json['success'];
    userName = json['user_name'];
    sId = json['s_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['status'] = this.status;
    data['token'] = this.token;
    data['success'] = this.success;
    data['user_name'] = this.userName;
    data['user_id'] = this.sId;
    return data;
  }
}
