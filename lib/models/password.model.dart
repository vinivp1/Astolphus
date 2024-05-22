class Password{
  String? password;

  Password({this.password});

  Password.fromJson(Map<dynamic, dynamic> json){
    password = json[''];
  }
}
