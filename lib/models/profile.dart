class Profile {
  final String name;
  final String image_url;
  Profile({this.name, this.image_url});
  Profile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image_url = json['image_url'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_url'] = this.image_url;
    return data;
  }
}
