class userData {
  int? id;
  String? fName;
  String? lName;
  String? email;
  String? phone;
  String? address;
  int? status;
  String? profileImage;
  String? createdAt;
  String? updatedAt;

  userData(
      {this.id,
        this.fName,
        this.lName,
        this.email,
        this.phone,
        this.address,
        this.status,
        this.profileImage,
        this.createdAt,
        this.updatedAt});

  userData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    status = json['status'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['status'] = this.status;
    data['profile_image'] = this.profileImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
