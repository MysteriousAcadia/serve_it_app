class Settings {
  bool isProvideServicesEnabled;
  bool isReceiveServicesEnabled;

  Settings() {
    isProvideServicesEnabled = true;
    isReceiveServicesEnabled = true;
  }

  Settings.fromJson(Map<String, dynamic> json)
      : isProvideServicesEnabled = json['isProvideServicesEnabled'],
        isReceiveServicesEnabled = json['isReceiveServicesEnabled'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isProvideServicesEnabled'] = this.isProvideServicesEnabled;
    data['isReceiveServicesEnabled'] = this.isReceiveServicesEnabled;
    return data;
  }
}
