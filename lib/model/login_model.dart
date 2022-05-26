class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? currentTeamId;
  String? otp;
  String? status;
  Null? profilePhotoPath;
  String? profilePhotoUrl;

  Data(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.currentTeamId,
        this.otp,
        this.status,
        this.profilePhotoPath,
        this.profilePhotoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    name = json['data']['name'];
    email = json['data']['email'];
    emailVerifiedAt = json['data']['email_verified_at'];
    currentTeamId = json['data']['current_team_id'];
    otp = json['data']['otp'];
    status = json['data']['status'];
    profilePhotoPath = json['data']['profile_photo_path'];
    profilePhotoUrl = json['data']['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['current_team_id'] = currentTeamId;
    data['otp'] = otp;
    data['status'] = status;
    data['profile_photo_path'] = profilePhotoPath;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}