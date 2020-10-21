class Address {
  final String latitude;
  final String longitude;
  final String locality;
  Address({this.locality,this.latitude, this.longitude});
  Address.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        locality = json['locality'],
        longitude = json['longitude'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['locality'] = this.locality;
    return data;
  }
}
