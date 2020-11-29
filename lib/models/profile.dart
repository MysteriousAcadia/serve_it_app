import 'package:serveit/models/adress.dart';

class Profile {
  final String name;
  final String image_url;
  final String email;
  final String mobile;
  final int role;
  final Address address;
  final int communityVerified;
  Profile({this.email, this.mobile, this.role, this.address, this.communityVerified, this.name, this.image_url});
  Profile.fromJson(Map<String, dynamic> json):
       name = json == null ? "TEST" : json['name'],
      email = json== null? "TEST":json['email'],
      mobile = json == null?"TEST":json['mobile'],
      address = json== null?Address(): Address.fromJson(json['address']),
      role = json==null?-1:json['role'],
      communityVerified= json ==null?-1:json['community_verified'],
      image_url = json == null ? "TEST" : json['image_url'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_url'] = this.image_url;
    return data;
  }
}
