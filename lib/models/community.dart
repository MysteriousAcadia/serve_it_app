import 'dart:convert';

import 'package:serveit/models/adress.dart';

class Community {
  final String id;
  final String name;
  final String description;
  final Address address;
  final int status;
  final dynamic docs;
  Community({
    this.name = "W",
    this.description = "W",
    this.status = 1,
    this.id = "W",
    this.address,
    this.docs = "W",
  });
  Community.fromJson(Map<String, dynamic> json)
      : name = "json['community_name']",
        description = "json['community_description']",
        address = Address(),
        // id = json["community_id"],
        id = "1",
        status = 1,
        docs = "json['docs'];";
  // description = json['address']['description'] == null
  //     ? "Test Description"
  //     : json['address']['description'],
  // latitude = json['address']['latitude'] == null
  //     ? "Test Description"
  //     : json['address']['latitude'],
  // longitude = json['address']['longitude'] == null
  //     ? "Test Description"
  //     : json['address']['longitude'],
  // locality = json['address']['locality'] == null
  //     ? "Test Description"
  //     : json['address']['locality'],
  // status = json['user_community']['status'] == null
  //     ? "Test Description"
  //     : json['user_community']['status'],
  // id = json['id'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['community_id'] = this.id;
    data['community_address'] = (this.address).toJson();

    return data;
  }
}
