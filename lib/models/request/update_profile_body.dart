class UpdateProfileBody {
  final String name;
  final String address;
  final String profile_url;

  const UpdateProfileBody({this.name, this.address, this.profile_url});

  UpdateProfileBody.fromJson(Map<String, dynamic> json)
      : name = json['id'],
        address = json['address'],
        profile_url = json['profile_url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.name;
    data['last_name'] = this.profile_url;
    data['address'] = this.address;
    return data;
  }

  @override
  String toString() => 'LoginBody { name: $name, address: $address, url: $profile_url }';
}
