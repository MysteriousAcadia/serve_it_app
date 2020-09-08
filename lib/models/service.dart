class Service{
  final String name;
  final String description;
  final String uid;
  Service({this.name, this.description, this.uid});
  Service.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        uid = json['uid'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['uid'] = this.uid;
    return data;
  }
}