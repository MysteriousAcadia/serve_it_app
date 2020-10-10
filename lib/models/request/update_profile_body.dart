class UpdateProfileBody {
  final String name;
  final String address;
  final String profilePic;
  final String mobile;
  final String email;

  const UpdateProfileBody(
      {this.mobile, this.email, this.name, this.address, this.profilePic});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['first_name'] = this.name;
    }
    if (this.profilePic != null) {
      data['profile_pic'] = this.profilePic;
    }
    if (this.mobile != null) {
      data['mobile'] = this.mobile;
    }
    if(this.email!=null){
    data['email'] = this.email;

    }
    return data;
  }

  @override
  String toString() =>
      'LoginBody { name: $name, address: $address, url: $profilePic }';
}
