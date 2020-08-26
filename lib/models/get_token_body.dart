class LoginBody{
  final String id;

  const LoginBody({this.id});

  LoginBody.fromJson(Map<String, dynamic> json)
      : id = json['id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() => 'LoginBody { id: $id }';

}
