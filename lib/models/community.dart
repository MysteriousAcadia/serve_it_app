class Community {
  final String id;
  final String name;
  final String description;
  final String latitude;
  final String longitude;
  final String locality;
  final int status;
  Community(this.latitude, this.longitude, this.locality, {this.name, this.description, this.status, this.id});
  Community.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['address']['description'],
        latitude = json['address']['latitude'],
        longitude = json['address']['longitude'],
        locality = json['address']['locality'],
        status = json['user_community']['status'],
        id = json['id'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}
