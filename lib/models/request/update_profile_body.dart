import 'package:serveit/models/adress.dart';

class UpdateProfileBody {
  final String name;
  final String profilePic;
  final String mobile;
  final String email;
  final Address address;

  const UpdateProfileBody({
    this.mobile,
    this.email,
    this.name,
    this.address,
    this.profilePic,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.profilePic != null) {
      data['profile_pic'] = this.profilePic;
    }
    if (this.mobile != null) {
      data['mobile'] = this.mobile;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.address != null) {
      data['address'] = this.address!=null?this.address.toJson():null;
    }
    return data;
  }

  @override
  String toString() =>
      'LoginBody { name: $name, address: $address, url: $profilePic }';
}
